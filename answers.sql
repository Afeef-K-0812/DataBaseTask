CREATE table Course(course_id INT primary key auto_increment,course_name varchar(100) not null unique,duration varchar(100),fee float);
CREATE table Student(student_id INT primary key auto_increment,student_name varchar(100) not null unique,email varchar(100) unique,age int,gender varchar(100),mark float,course_id int,foreign key(course_id) references course(course_id));
INSERT INTO Course (course_name,duration,fee) VALUES ('Python Django','7 Months',45000),('Data Science','7 Months',50000),('Web Development','6 Months',40000),('Cyber Security','6 Months',42000);
INSERT INTO Student (student_name,email,age,gender,mark,course_id) VALUES ('Arun','arun@gmail.com',20,'Male',90,1),('Amal','amal@gmail.com',22,'Male',87,1),('Anu','anu@gmail.com',21,'Female',90,2),('Anju','anju@gmail.com',23,'Female',94,2),('Kiran','kiran@gmail.com',24,'Male',85,3),('Tom','tom@gmail.com',23,'Male',89,3),('Jena','jena@gmail.com',22,'Female',87,4),('John','john@gmail.com',24,'Male',80,4);

SELECT * FROM Student WHERE mark>80 ORDER BY mark DESC;

SELECT MAX(mark) AS highest_mark,MIN(mark) AS lowest_mark,AVG(mark) AS average_mark FROM Student;

SELECT * FROM Student ORDER BY mark DESC LIMIT 5;

SELECT student_name,mark,age FROM Student WHERE age BETWEEN 18 AND 25 ORDER BY age;

SELECT c.course_id,c.course_name, COUNT(s.student_id) AS student_count FROM Course c LEFT JOIN Student s ON c.course_id=s.course_id GROUP BY c.course_id,c.course_name;

SELECT c.course_id,c.course_name,COUNT(s.student_id) AS student_count FROM Course c INNER JOIN Student s ON c.course_id=s.course_id GROUP BY c.course_id,c.course_name HAVING COUNT(s.student_id)>2;

SELECT s.student_name,s.mark,c.course_name FROM Student s INNER JOIN Course c ON s.course_id=c.course_id;

SELECT c.course_name,s.student_name,s.mark FROM Course c LEFT JOIN Student s ON c.course_id=s.course_id ORDER BY c.course_name;

SELECT student_name,mark FROM Student WHERE mark>(SELECT AVG(mark) FROM Student);

SELECT s.student_name,s.mark,c.course_name FROM Student s INNER JOIN Course c ON s.course_id=c.course_id WHERE s.mark=(SELECT MAX(mark) FROM Student WHERE mark<(SELECT MAX(mark) FROM Student));