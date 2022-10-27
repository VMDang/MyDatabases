use db_citedu;

# Cau 1 
SELECT * FROM courses
WHERE status = 1;

# Cau 2
SELECT co.name as Khoa_hoc,le.name as Bai_hoc
FROM courses as co JOIN lessons as le
ON co.id = le.courses_id;

# Cau 3 
SELECT *
FROM classes
WHERE status = 1;		# status =0 chua hoc, =1 dang hoc, =2 da hoc xong


#Cau 4 
SELECT cl.name,co.name
FROM classes as cl JOIN courses as co			
ON cl.courses_id = co.id;
# WHERE courses.id = 1;

#Cau 5
SELECT cl.name as class_name,std.name as student_name
FROM classes as cl JOIN class_student ON class_student.classes_id = cl.id 
JOIN students as std ON std.id = class_student.students_id
WHERE cl.name = 'TDTN 13.1';

#Cau6
SELECT cl.name as class_name,std.name as student_name
FROM classes as cl JOIN class_student ON class_student.classes_id = cl.id 
JOIN students as std ON std.id = class_student.students_id 
WHERE std.name = 'Đào Thị Hồng';

#Cau7
SELECT std.name as Student_Name ,co.name as Course_Name
FROM courses as co JOIN classes as cl ON co.id = cl.courses_id
JOIN class_student ON class_student.classes_id = cl.id 
JOIN students as std ON std.id = class_student.students_id 
WHERE std.name = 'Đào Thị Hồng';

# Cau 8
SELECT cl.name as Class_Name,le.name as Name_Lesson, std.name as Student_Name, att.status
FROM classes as cl JOIN studies as st ON cl.id = st.class_id
JOIN attendance as att ON st.id = att.study_id
JOIN students as std ON std.id = att.student_id
JOIN lessons as le ON le.id = st.lesson_id
WHERE std.name = 'Nguyễn Duy Khánh' AND cl.name = 'TLKN 10.1'
ORDER BY le.id ASC;

#Cau 9
SELECT cl.name as Class_Name,le.name as Name_Lesson, std.name as Student_Name, att.status
FROM classes as cl JOIN studies as st ON cl.id = st.class_id
JOIN attendance as att ON st.id = att.study_id
JOIN students as std ON std.id = att.student_id
JOIN lessons as le ON le.id = st.lesson_id
WHERE cl.name = 'TLKN 10.1'
ORDER BY le.id ASC;