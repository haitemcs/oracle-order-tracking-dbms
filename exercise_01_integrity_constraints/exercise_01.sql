-- ============================================================
-- EXERCISE 01: INTEGRITY CONSTRAINTS
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
      references student( student_id ),
   grade      number check ( grade between 0 and 20 ),
   exam_date  date not null
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
insert into EXAM_RESULT values (
    1,
    1,
    20,
    2026-02-01
);

insert into EXAM_RESULT values (
    2,
    2,
    10,
    2026-10-2
);

-- TODO: INSERT EXAM RESULTS

insert into student values
   ( 1,
     haitem,
     14,
     yow@gmail.com );

-
-- TASK 7:
-- Test referential integrity.
-- Try inserting a result for a nonexistent student.

-- TODO: TEST INVALID FOREIGN KEY



-- TASK 8:
-- Display the students and their exam results.

-- TODO: WRITE A SELECT QUERY

SELECT
    s.student_id,
    s.student_name,
    s.age,
    s.email,
    er.result_id,
    er.grade,
    er.exam_date
 FROM student s
 JOIN exam_result er
    ON s.student_id = er.student_id
 ORDER BY s.student_id;


