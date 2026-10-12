create table student (
   student_id   number primary key,
   student_name varchar2(50) not null,
   age          number check ( age >= 16 ),
   email        varchar2(100) unique
);


create table exam_result (
   result_id  number primary key,
   student_id number
      references student ( student_id ),
   grade      number check ( grade between 0 and 20 ),
   exam_date  date not null
);