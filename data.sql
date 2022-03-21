create database student_manager;
use student_manager;
create table address (
  id int auto_increment primary key ,
  name nvarchar(50)not null
);
create table classes (
  id int auto_increment primary key ,
  name nvarchar(20)not null ,
  language nvarchar(20),
  description text
);
create table course(
  id   int auto_increment primary key ,
  name nvarchar(20)not null ,
  description text
);
create table students(
    id   int auto_increment primary key ,
    full_name nvarchar(50) not null ,
    address_id int,
    age int,
    phone nvarchar(20) unique ,
    class_id int,
    foreign key (address_id) references address(id),
    foreign key (class_id) references classes(id)
);
# Bảng Point(id, course_id, student_id, point)
create table point (
  id  int auto_increment primary key ,
  course_id int,
  student_id int,
  point int,
  foreign key (course_id) references course(id),
  foreign key (student_id) references students(id)
);
# Thêm 5 bản ghi trong bảng Address
# Thêm 5 bản ghi trong bảng Classes
# Thêm 10 bản ghi trong bảng Student
# Thêm 15 bản ghi trong bảng Point
select * from students;
select * from students where full_name like 'Nguyen%';
select * from students where full_name like '%Anh';
select * from students where age between 15 and 18;
select * from students where id between 12 and 13;
select s.full_name,c.name from students s join classes c on s.class_id = c.id;
select c.name as 'ten lop',count(c.name) as 'so hoc vien' from students s join classes c on s.class_id = c.id group by c.name;
select a.name as 'ten tinh',count(a.name) as 'so hoc vien' from students s join address a on s.address_id = a.id  group by a.name;
select c.name,p.student_id,p.point from course c join point p on c.id = p.course_id;
select c.name,avg(p.point) from course c join point p on c.id = p.course_id group by c.name;

create table avg_point select c.name,avg(p.point) from course c join point p on c.id = p.course_id group by c.name;
select * from avg_point;
select name,max(`avg(p.point)`) from avg_point;



