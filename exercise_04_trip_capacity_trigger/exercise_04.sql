-- ============================================================
-- EXERCISE 04: PREVENTING TRIP OVERBOOKING
-- Topics: Foreign keys, compound triggers, aggregation,
--         row locking, and application errors.
--
-- Run this script in a dedicated practice schema.
-- It creates new TRIP and RESERVATION tables.
-- ============================================================

-- 1. CREATE THE TABLES

CREATE TABLE trip (
    trip_id     NUMBER PRIMARY KEY,
    destination VARCHAR2(50) NOT NULL,
    trip_date   DATE NOT NULL,
    max_places  NUMBER NOT NULL CHECK (max_places > 0)
);

CREATE TABLE reservation (
    reservation_id NUMBER PRIMARY KEY,
    trip_id        NUMBER NOT NULL REFERENCES trip(trip_id),
    customer_name  VARCHAR2(50) NOT NULL,
    nb_persons     NUMBER NOT NULL CHECK (nb_persons > 0)
);

-- 2. CREATE THE CAPACITY TRIGGER
--
-- A normal row-level trigger cannot query RESERVATION while
-- RESERVATION is being modified. Oracle can raise ORA-04091
-- (mutating-table error).
--
-- This compound trigger checks capacity AFTER the INSERT statement.
-- It locks the corresponding TRIP row before each inserted row.
-- The lock helps serialize reservations for the same trip.

CREATE OR REPLACE TRIGGER trig_check_places
FOR INSERT ON reservation
COMPOUND TRIGGER

    TYPE t_trip_ids IS TABLE OF trip.trip_id%TYPE
        INDEX BY PLS_INTEGER;

    g_trip_ids t_trip_ids;

    BEFORE EACH ROW IS
        v_max NUMBER;
    BEGIN
        -- Lock the trip row to coordinate reservations for this trip.
        SELECT max_places
        INTO v_max
        FROM trip
        WHERE trip_id = :NEW.trip_id
        FOR UPDATE;

        -- Remember the trip that received a new reservation.
        g_trip_ids(g_trip_ids.COUNT + 1) := :NEW.trip_id;
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
        v_total NUMBER;
        v_max   NUMBER;
    BEGIN
        -- Check the final total after all rows have been inserted.
        FOR i IN 1 .. g_trip_ids.COUNT LOOP

            SELECT NVL(SUM(nb_persons), 0)
            INTO v_total
            FROM reservation
            WHERE trip_id = g_trip_ids(i);

            SELECT max_places
            INTO v_max
            FROM trip
            WHERE trip_id = g_trip_ids(i);

            IF v_total > v_max THEN
                RAISE_APPLICATION_ERROR(
                    -20040,
                    'Error: the total number of participants exceeds '
                    || 'the trip capacity (' || v_max || ').'
                );
            END IF;

        END LOOP;
    END AFTER STATEMENT;

END trig_check_places;
/

-- 3. INSERT TRIPS

INSERT INTO trip
    (trip_id, destination, trip_date, max_places)
VALUES
    (1, 'Paris', TO_DATE('2025-11-15', 'YYYY-MM-DD'), 10);

INSERT INTO trip
    (trip_id, destination, trip_date, max_places)
VALUES
    (2, 'Rome', TO_DATE('2025-12-05', 'YYYY-MM-DD'), 8);

-- 4. INSERT VALID RESERVATIONS
-- Trip 1: 3 + 4 = 7 people. Capacity = 10.

INSERT INTO reservation
    (reservation_id, trip_id, customer_name, nb_persons)
VALUES
    (101, 1, 'Lamamra Ali', 3);

INSERT INTO reservation
    (reservation_id, trip_id, customer_name, nb_persons)
VALUES
    (102, 1, 'Nadia Diabi', 4);

COMMIT;

-- 5. TEST AN INVALID INSERT
-- Uncomment and execute this statement separately.
-- Trip 1 already has 7 people. Adding 5 would make 12.
-- The trigger should reject the statement with ORA-20040.
--
-- INSERT INTO reservation
--     (reservation_id, trip_id, customer_name, nb_persons)
-- VALUES
--     (103, 1, 'Samir Boukhari', 5);

-- 6. VERIFY THE RESERVATIONS AND CAPACITY

SELECT
    t.trip_id,
    t.destination,
    t.max_places,
    NVL(SUM(r.nb_persons), 0) AS reserved_places,
    t.max_places - NVL(SUM(r.nb_persons), 0) AS available_places
FROM trip t
LEFT JOIN reservation r
    ON r.trip_id = t.trip_id
GROUP BY
    t.trip_id,
    t.destination,
    t.max_places
ORDER BY t.trip_id;

-- 7. INSPECT THE TRIGGER

SELECT
    trigger_name,
    table_name,
    status
FROM user_triggers
WHERE trigger_name = 'TRIG_CHECK_PLACES';

-- NOTES
-- NVL(value, 0) returns 0 when value is NULL.
-- SUM(nb_persons) calculates the total number of reserved places.
-- :NEW refers to the new row being inserted.
-- FOR UPDATE locks the selected TRIP row until the transaction ends.
-- RAISE_APPLICATION_ERROR uses an error number from -20000 to -20999.
-- || joins text values together.
-- TO_DATE converts a character string into a DATE value.
