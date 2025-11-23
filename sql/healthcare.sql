use piit;
create table patients (patient_id INT PRIMARY KEY AUTO_INCREMENT, first_name VARCHAR(50), last_name VARCHAR(50), gender VARCHAR(50), dob DATE,
contact_no VARCHAR(10));
create table doctor(doctor_id INT PRIMARY KEY AUTO_INCREMENT,first_name VARCHAR(50), last_name VARCHAR(50), speciality VARCHAR(10), contact_no VARCHAR(10));
insert into patients (first_name, last_name, dob, gender, contact_no) Values
('John', 'Doe', '1980-05-12', 'Male', '1234567890'),
('Jane', 'Smith', '1990-11-23', 'Female', '0987654321'),
('Alice', 'Williams', '1975-08-19', 'Female', '5554443333'),
('Bob', 'Johnson', '1985-02-28', 'Male', '7778889999');
INSERT INTO doctor (first_name, last_name, speciality, contact_no)
VALUES
('Alice', 'Brown', 'Cardiology', '1112223333'),
('Bob', 'Johnson', 'Neurology', '4445556666'),
('Carol', 'Miller', 'Pediatrics', '9998887777'),
('David', 'Lee', 'General', '6665554444');

select * from patients;
select * from doctor;

#Basic / Beginner
# 1. How would you list all patients in alphabetical order by last name?
select * from patients order by last_name asc; 

#2. How can you find the total number of doctors in your table?
select count(*) AS total_doctor from doctor;

# 3.How would you retrieve only the first name and specialty of all doctors?
select first_name, speciality from doctor;

# 4.What is the difference between CHAR and VARCHAR data types, and why would you use one over the other for patient names?

# 5. How would you filter patients who are female or born after 1990?
select * from patients where gender = 'female' or dob > '1990-01-01';

# 5. Retrieve first names starting with 'A'
select * from patients where first_name like 'A%';

# Intermediate

# 7.How would you find patients whose first or last name starts with the letter “A”?
select * from patients where first_name like 'A%' or last_name like 'A%';

# How can you calculate the age of all patients based on their dob?
select first_name, last_name, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age FROM patients;

# How would you identify doctors with duplicate specialties?
SELECT speciality, COUNT(*) AS count FROM doctor GROUP BY speciality HAVING count > 1;

# How would you handle missing or NULL contact numbers in the patients table?
SELECT * FROM patients WHERE contact_no IS NULL;

# If you want to combine patients and doctors data to see potential pairings, what type of join would you use and why?
select p.first_name AS patients , d.first_name AS doctor
from patients p 
cross join doctor d;

# Count male and female patients
select gender, count(*) AS total from patients group by gender;

# Oldest and youngest patient
select first_name, last_name, dob from patients order by dob desc;
select first_name, last_name, dob from patients order by dob asc;

# Unique contact numbers across patients and doctors
ALTER TABLE patients ADD CONSTRAINT UNIQUE(contact_no);

# Detect duplicate patients
SELECT first_name, last_name, dob, COUNT(*) AS duplicates
FROM patients
GROUP BY first_name, last_name, dob
HAVING duplicates > 1;