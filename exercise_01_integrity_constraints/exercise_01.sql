-- ============================================================
-- EXERCISE 01: INTEGRITY CONSTRAINTS
-- Difficulty: EASY
-- Topics: PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, NOT NULL
-- ============================================================

-- OBJECTIVE:
-- Create STUDENT and EXAM_RESULT tables with appropriate
-- integrity constraints.
--
-- TASK 1:
-- Create STUDENT with:
--   student_id   NUMBER          PRIMARY KEY
--   student_name VARCHAR2(50)    NOT NULL
--   age          NUMBER          Must be >= 16
--   email        VARCHAR2(100)   UNIQUE
--
-- Write your CREATE TABLE statement below.
create table student (
   student_id   number primary key,
   student_name varchar2(50) not null,
   age          number check ( age >= 16 ),
   email        varchar2(100) unique
);

-- TODO: CREATE TABLE STUDENT


-- TASK 2:
-- Create EXAM_RESULT with:
--   result_id   NUMBER PRIMARY KEY
--   student_id  NUMBER REFERENCES STUDENT(student_id)
--   grade       NUMBER BETWEEN 0 AND 20
--   exam_date   DATE NOT NULL
--
-- Write your CREATE TABLE statement below.
create table exam_result (
   result_id  number primary key,
   student_id number
      references to ( student ),
   grade      number check ( grade between 0 and 20 ),
   exam_date  timestamp not null
)

-- TODO: CREATE TABLE EXAM_RESULT


-- TASK 3:
-- Insert two students.

-- TODO: INSERT STUDENTS
insert into student values
   ( 1,
     haitem,
     20,
     haitem@gmail.com );
insert into student values
   ( 2,
     dina,
     20,
     dina@gmail.com ); 

-- TASK 4:
-- Insert two exam results for existing students.

-- TODO: INSERT EXAM RESULTS


-- TASK 5:
-- Test the age constraint.
-- What happens when you try inserting a student aged 14?

-- TODO: TEST INVALID AGE


-- TASK 6:
-- Test the grade constraint.
-- What happens when you insert a grade of 22?

-- TODO: TEST INVALID GRADE


-- TASK 7:
-- Test referential integrity.
-- Try inserting a result for a nonexistent student.

-- TODO: TEST INVALID FOREIGN KEY


-- TASK 8:
-- Display the students and their exam results.

-- TODO: WRITE A SELECT QUERY


-- THEORY QUESTIONS:
-- 1. What is an integrity constraint?
-- 2. What is the difference between PRIMARY KEY and UNIQUE?
-- 3. Why is the age constraint a static constraint?
-- 4. What is referential integrity?
-- 5. Identify the primary key and foreign key in EXAM_RESULT.