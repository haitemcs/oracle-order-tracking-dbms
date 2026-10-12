-- ============================================================
-- EXERCISE 02: SALARY PROTECTION TRIGGER
-- Difficulty: INTERMEDIATE
-- Topics: PL/SQL, BEFORE UPDATE, :OLD, :NEW, exceptions
-- ============================================================

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

