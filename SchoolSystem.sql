                  -- SChool System.
Create Database StudentSystem;

-- Course.
Create Table Course(course_id integer primary key, course_name varchar(50));    

-- Students.
Create Table Students(stu_id integer primary key,stu_name varchar(50),course_id integer,
Foreign key (course_id) references Course(course_id));

-- Marks.
Create table Marks(stu_id integer,marks integer,
foreign key (stu_id) references Students(stu_id));

Insert into Course Values(1, 'SQL');
Insert into Course Values (2, 'Python');
Insert into Course Values (3, 'Java');

Insert into Students Values (101, 'Ravi', 1);
Insert into Students Values (102, 'Meena', 2);
Insert into Students Values (103, 'Arun', 3);
Insert into Students Values (104, 'Divya', 1);
Insert into Students Values(105, 'Karthik', 2);

Insert into Marks Values (101, 85);
Insert into Marks Values  (102, 90);
Insert into Marks Values  (103, 78);
Insert into Marks Values  (104, 88);
Insert into Marks Values  (105, 92);

-- 1)Display all students from STUDENTS.
Select * From Students;

-- 2)Show student names and their marks.
Select Students.stu_name,Marks.marks from Students
join Marks on Students.stu_id=Marks.stu_id;

-- 3)Find students who scored more than 90.
Select Students.stu_name,Marks.marks from Students
join Marks on Students.stu_id=Marks.stu_id
where Marks.marks>90;

-- 4)Display students who belong to course_id = 2.
Select Students.stu_name,Course.course_id from Students
join Course on Students.course_id=Course.course_id
where Course.course_id=2;

-- 5)Show students whose name ends with 'M'
Select * from Students 
where stu_name like 'M%'; 

-- 6)Find students who scored between 80 and 90.
Select Students.stu_name,Marks.marks from Students
join Marks on Students.stu_id=Marks.stu_id
where Marks.marks between 80 and 90;

-- 7)Sort students by marks in descending order.
Select Students.stu_name,Marks.marks from Students
join Marks on Students.stu_id=Marks.stu_id
order by Marks.marks Desc;

-- 8)Count total students.
Select count(stu_id) from Students; 

-- 9.	Find maximum marks 
Select Max(marks) from Marks;

-- 10)Find minimum marks.
Select min(marks) from Marks; 

-- 11)Calculate average marks.
Select avg(marks) from Marks;

-- 12)Display course_id and number of students in each course 
Select Course.course_id,count(Students.stu_id) as total_students from Course
join Students on Students.course_id=Course.course_id
group by Course.course_id;

-- 13)Find average marks for each course.
Select Course.course_id,Course.course_name,AVG(Marks) as avg_marks from Course
join Students on Students.course_id=Course.course_id
join marks on Marks.stu_id=Students.stu_id
group by Course.course_id,Course.course_name;

-- 14)Display student name and course name using JOIN .
Select Students.stu_name,Course.course_name 
from Students 
join Course on Students.course_id=Course.course_id;

-- 15)Show all students even if marks are not available (LEFT JOIN)
 Select Students.stu_id,Students.stu_name,Students.Course_id,Marks.marks from Students
 left outer join Marks on Students.stu_id=Marks.stu_id;
 
 -- 16)Find student who scored highest marks (subquery).
 Select Students.Stu_id,Students.stu_name,Marks.marks from Students
 join Marks on Students.stu_id=Marks.Stu_id 
 where Marks.marks=(Select max(marks) from Marks); 
 
 -- 17)Find students scoring above average marks 
  Select Students.Stu_id,Students.stu_name,Marks.marks from Students
 join Marks on Students.stu_id=Marks.Stu_id 
 where Marks.marks>(Select avg(marks) from Marks); 
 
 -- 18)Insert new student record.
 Insert into Students Values(106,'Ravi',3);
 
 -- 19)Update marks of a student 
 Update Marks
 set marks=marks+20
 where stu_id=103;
 select * from Marks;
 
 -- 20)Delete student record 
 Delete  from Students
 where stu_id=106;
 
 -- 21)Add CHECK constraint to MARKS table (marks <=100).
 Alter Table Marks
 Add constraint marks_check Check(marks<=100);
 
 -- 22)Rename column name to student_name 
 Alter Table Students
 change stu_name student_name varchar(50);
 
 -- 23)Drop MARKS table 
 Drop Table Marks;
 commit;
 
 -- 24.	Add PRIMARY KEY to STUDENTS 
 Alter table Students
 Add constraint pk_stu_id primary key (stu_id);
 
 -- 25)Add NOT NULL to course_name
 Alter table Course
 modify course_name varchar(50) not null;