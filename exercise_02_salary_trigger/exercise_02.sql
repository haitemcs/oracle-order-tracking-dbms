
--LESSON 02: TRIGGERS
--trigger is a special type of stored procedure that automatically executes (or fires) in response to a specific database event. 
--Unlike regular stored procedures, you do not call a trigger manually; the database engine runs it whenever the associated event occurs.

-- there is two type of trigger the first one is DML OR DDL 
--DML:(insert or update or delete)
--DDL:(create or alter or drop)


--steps :
--Someone updates a product
          |
          v
--Oracle detects the UPDATE
          |
          v
--The trigger executes
          |
          v
--The trigger performs its instructions



-- the general structure of trigger : 
create or replace trigger product_audit_trigger --create a trigger named product_audit_trigger if the name already exist it will replace it
after update on products
for each row 
begin
 DBMS_OUTPUT.PUT_LINE("A PRODUCT WAS UPDATED ");
END

 -- there is before and after 
 -- AFTER UPDATE ON products
 --BEFORE UPDATE ON products
 -- BEFORE Executes before the row operation is completed. AFTER Executes after the row operation has been performed.



























-- ============================================================
-- EXERCISE 02: SALARY PROTECTION TRIGGER
-- Topics: PL/SQL, BEFORE UPDATE, :OLD, :NEW, exceptions
-- STEP 1: CREATE THE TABLE

CREATE TABLE employees (
    employee_id   NUMBER PRIMARY KEY,
    employee_name VARCHAR2(50) NOT NULL,
    salary        NUMBER(10,2) CHECK (salary > 0)
);

-- STEP 2: INSERT TEST DATA

INSERT INTO employees VALUES (1, 'Amine', 40000);
INSERT INTO employees VALUES (2, 'Sara', 50000);

COMMIT;

-- STEP 3: YOUR TASK
--
-- Create a trigger named CHECK_SALARY_TRG.
-- 
-- Requirements:
--   1. Execute BEFORE UPDATE OF salary.
--   2. Execute FOR EACH ROW.
--   3. Compare :NEW.salary with :OLD.salary.
--   4. Reject a salary decrease.
--   5. Use RAISE_APPLICATION_ERROR.
--   6. Use error number -20001.
--
-- TODO: WRITE YOUR TRIGGER HERE


-- STEP 4: TEST A — SALARY INCREASE
-- Expected: SUCCESS
-- New salary: 45000

UPDATE employees
SET salary = 45000
WHERE employee_id = 1;

-- STEP 5: TEST B — SALARY DECREASE
-- Expected: ERROR
-- The salary must remain unchanged.

UPDATE employees
SET salary = 35000
WHERE employee_id = 1;

-- STEP 6: TEST C — ANOTHER SALARY INCREASE
-- Expected: SUCCESS
-- New salary: 55000

UPDATE employees
SET salary = 55000
WHERE employee_id = 2;

-- STEP 7: DISPLAY THE FINAL RESULTS

SELECT employee_id, employee_name, salary
FROM employees
ORDER BY employee_id;

-- STEP 8: CHECK YOUR TRIGGER

SELECT trigger_name, table_name, status
FROM user_triggers
WHERE trigger_name = 'CHECK_SALARY_TRG';

-- THEORY QUESTIONS:
-- 1. What does :OLD.salary represent? 
-- 2. What does :NEW.salary represent?
-- 3. Why is this a dynamic integrity constraint?
-- 4. What does BEFORE UPDATE OF salary mean?
-- 5. What does FOR EACH ROW mean?
-- 6. What happens when RAISE_APPLICATION_ERROR executes?

