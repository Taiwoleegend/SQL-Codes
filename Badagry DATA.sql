-- Create the database
CREATE DATABASE badagry_community_center;
USE badagry_community_center;

-- Students table to store personal information
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100),
    enrollment_date DATE NOT NULL,
    guardian_name VARCHAR(100),
    guardian_phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Courses table to store available programs
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT,
    start_date DATE NOT NULL,
    end_date DATE,
    instructor_name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL DEFAULT 30,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Enrollments table to track student course registrations
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    status ENUM('Active', 'Completed', 'Dropped') DEFAULT 'Active',
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE RESTRICT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Attendance table to track student attendance
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Excused') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE RESTRICT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample data for students
INSERT INTO students (first_name, last_name, date_of_birth, gender, address, phone_number, email, enrollment_date, guardian_name, guardian_phone) VALUES
('Adebayo', 'Oluwaseun', '2005-03-15', 'Male', '12 Market Street, Badagry', '08012345678', 'adebayo.olu@example.com', '2025-01-10', 'Funmi Oluwaseun', '08087654321'),
('Chinwe', 'Okeke', '2006-07-22', 'Female', '25 Agbara Road, Badagry', '07098765432', 'chinwe.okeke@example.com', '2025-01-12', 'Ifeanyi Okeke', '07012345678'),
('Tunde', 'Adekunle', '2004-11-05', 'Male', '7 Oba Akran Avenue, Badagry', '08123456789', 'tunde.ade@example.com', '2025-01-15', 'Bisi Adekunle', '08198765432'),
('Ngozi', 'Eze', '2007-02-18', 'Female', '14 Ajegunle Lane, Badagry', '09087654321', 'ngozi.eze@example.com', '2025-01-14', 'Chukwu Eze', '09012345678'),
('Kemi', 'Adeyemi', '2005-09-30', 'Female', '3 Marina Road, Badagry', '08034567890', 'kemi.ade@example.com', '2025-01-16', 'Tola Adeyemi', '08067890123'),
('Chidi', 'Okafor', '2006-04-12', 'Male', '19 Seme Border, Badagry', '07023456789', 'chidi.oka@example.com', '2025-01-17', 'Amaka Okafor', '07089012345'),
('Fatima', 'Sule', '2005-12-01', 'Female', '8 Lagos Street, Badagry', '08156789012', 'fatima.sule@example.com', '2025-01-18', 'Ibrahim Sule', '08123456780'),
('Emeka', 'Nwachukwu', '2004-06-25', 'Male', '22 Topo Road, Badagry', '09034567890', 'emeka.nwa@example.com', '2025-01-19', 'Ngozi Nwachukwu', '09067890123'),
('Bola', 'Ogunleye', '2007-08-10', 'Female', '15 Badagry Express, Badagry', '08045678901', 'bola.ogu@example.com', '2025-01-20', 'Segun Ogunleye', '08090123456'),
('Yusuf', 'Abdullahi', '2006-03-03', 'Male', '5 Wharf Road, Badagry', '07056789012', 'yusuf.abd@example.com', '2025-01-21', 'Aisha Abdullahi', '07023456789'),
('Esther', 'Akinola', '2005-05-17', 'Female', '30 Joseph Street, Badagry', '08167890123', 'esther.aki@example.com', '2025-01-22', 'Dele Akinola', '08134567890'),
('Obinna', 'Ikechukwu', '2004-10-09', 'Male', '17 Cemetery Road, Badagry', '09045678901', 'obinna.ike@example.com', '2025-01-23', 'Chioma Ikechukwu', '09012345678'),
('Aminat', 'Lawal', '2006-01-14', 'Female', '9 Araromi Street, Badagry', '08078901234', 'aminat.law@example.com', '2025-01-24', 'Sule Lawal', '08045678901'),
('Femi', 'Olatunji', '2005-07-28', 'Male', '21 Ibereko Road, Badagry', '07067890123', 'femi.ola@example.com', '2025-01-25', 'Yemi Olatunji', '07034567890'),
('Grace', 'Ojo', '2007-04-20', 'Female', '11 Toga Street, Badagry', '08178901234', 'grace.ojo@example.com', '2025-01-26', 'Tunde Ojo', '08145678901'),
('Ifeanyi', 'Udeh', '2006-09-11', 'Male', '26 Posukoh Quarters, Badagry', '09056789012', 'ifeanyi.ude@example.com', '2025-01-27', 'Ada Udeh', '09023456789'),
('Tolu', 'Adewale', '2005-02-08', 'Female', '4 Ajara Road, Badagry', '08089012345', 'tolu.ade@example.com', '2025-01-28', 'Wale Adewale', '08056789012'),
('Hassan', 'Bello', '2004-12-22', 'Male', '18 Mowo Street, Badagry', '07078901234', 'hassan.bel@example.com', '2025-01-29', 'Fatima Bello', '07045678901'),
('Chisom', 'Ezeh', '2006-06-15', 'Female', '13 Hunbe Road, Badagry', '08189012345', 'chisom.eze@example.com', '2025-01-30', 'Emeka Ezeh', '08156789012'),
('Segun', 'Olowo', '2005-11-03', 'Male', '27 Jegba Quarters, Badagry', '09067890123', 'segun.olo@example.com', '2025-01-31', 'Bimpe Olowo', '09034567890'),
('Joy', 'Adesina', '2007-03-25', 'Female', '6 Asa Road, Badagry', '08090123456', 'joy.ade@example.com', '2025-02-01', 'Tayo Adesina', '08067890123'),
('Musa', 'Yakubu', '2006-08-19', 'Male', '20 Oke Oja, Badagry', '07089012345', 'musa.yak@example.com', '2025-02-02', 'Aminu Yakubu', '07056789012'),
('Funke', 'Ogundipe', '2005-04-07', 'Female', '10 Gbaji Street, Badagry', '08190123456', 'funke.ogu@example.com', '2025-02-03', 'Lekan Ogundipe', '08167890123'),
('Chukwuma', 'Okoro', '2004-09-12', 'Male', '23 Isalu Road, Badagry', '09078901234', 'chukwuma.oko@example.com', '2025-02-04', 'Nkechi Okoro', '09045678901'),
('Rukayat', 'Sanni', '2006-02-14', 'Female', '16 Doven Street, Badagry', '08023456789', 'rukayat.san@example.com', '2025-02-05', 'Ismail Sanni', '08090123456'),
('Tobi', 'Afolabi', '2005-10-30', 'Male', '28 Agbamaya Street, Badagry', '07090123456', 'tobi.afo@example.com', '2025-02-06', 'Shade Afolabi', '07067890123'),
('Amaka', 'Onuoha', '2007-01-05', 'Female', '5 Finny Road, Badagry', '08123456780', 'amaka.onu@example.com', '2025-02-07', 'Chinedu Onuoha', '08189012345'),
('Sani', 'Mohammed', '2006-05-22', 'Male', '19 Magbon Street, Badagry', '09090123456', 'sani.moh@example.com', '2025-02-08', 'Hauwa Mohammed', '09056789012'),
('Yetunde', 'Oshodi', '2005-07-10', 'Female', '14 Oba Owo Street, Badagry', '08056789012', 'yetunde.osh@example.com', '2025-02-09', 'Kunle Oshodi', '08023456789'),
('Ugo', 'Nnamdi', '2004-11-27', 'Male', '22 Agbalumo Road, Badagry', '07023456780', 'ugo.nna@example.com', '2025-02-10', 'Ify Nnamdi', '07090123456'),
('Zainab', 'Idris', '2006-03-09', 'Female', '8 Ilogbo Street, Badagry', '08156789013', 'zainab.idr@example.com', '2025-02-11', 'Ali Idris', '08123456781'),
('Bayo', 'Ogunbiyi', '2005-08-15', 'Male', '17 Oke Oko, Badagry', '09023456789', 'bayo.ogu@example.com', '2025-02-12', 'Temi Ogunbiyi', '09090123456'),
('Adaobi', 'Chukwu', '2007-06-02', 'Female', '11 Apa Road, Badagry', '08067890124', 'adaobi.chu@example.com', '2025-02-13', 'Obi Chukwu', '08034567891'),
('Ibrahim', 'Usman', '2006-04-18', 'Male', '25 Isalu Quarters, Badagry', '07056789013', 'ibrahim.usm@example.com', '2025-02-14', 'Fatima Usman', '07023456780'),
('Shade', 'Oladipo', '2005-12-05', 'Female', '9 Toga Lane, Badagry', '08167890124', 'shade.ola@example.com', '2025-02-15', 'Wale Oladipo', '08134567891'),
('Chika', 'Okonkwo', '2004-10-20', 'Male', '20 Jegba Street, Badagry', '09067890124', 'chika.oko@example.com', '2025-02-16', 'Nneka Okonkwo', '09034567891'),
('Aisha', 'Salisu', '2006-09-07', 'Female', '13 Mowo Road, Badagry', '08078901235', 'aisha.sal@example.com', '2025-02-17', 'Yusuf Salisu', '08045678902'),
('Lekan', 'Adeniyi', '2005-03-22', 'Male', '26 Agbara Lane, Badagry', '07089012346', 'lekan.ade@example.com', '2025-02-18', 'Bisi Adeniyi', '07056789013'),
('Nkechi', 'Onyema', '2007-02-11', 'Female', '7 Finny Street, Badagry', '08190123457', 'nkechi.ony@example.com', '2025-02-19', 'Emeka Onyema', '08167890124'),
('Sola', 'Ogunrinde', '2006-07-30', 'Male', '18 Oba Akran, Badagry', '09078901235', 'sola.ogu@example.com', '2025-02-20', 'Funke Ogunrinde', '09045678902'),
('Blessing', 'Ajayi', '2005-05-14', 'Female', '15 Gbaji Road, Badagry', '08090123457', 'blessing.aja@example.com', '2025-02-21', 'Tunde Ajayi', '08067890124'),
('Ahmed', 'Baba', '2004-12-09', 'Male', '22 Doven Quarters, Badagry', '07090123457', 'ahmed.bab@example.com', '2025-02-22', 'Hajia Baba', '07056789014'),
('Ebere', 'Uzo', '2006-01-25', 'Female', '10 Magbon Lane, Badagry', '08123456781', 'ebere.uzo@example.com', '2025-02-23', 'Chidi Uzo', '08189012346'),
('Tayo', 'Oshoba', '2005-10-03', 'Male', '19 Apa Street, Badagry', '09090123457', 'tayo.osh@example.com', '2025-02-24', 'Yemi Oshoba', '09067890124'),
('Hauwa', 'Garba', '2007-04-15', 'Female', '6 Ilogbo Road, Badagry', '08023456781', 'hauwa.gar@example.com', '2025-02-25', 'Sani Garba', '08090123457'),
('Kola', 'Akinwale', '2006-06-27', 'Male', '24 Oke Oja Street, Badagry', '07023456781', 'kola.aki@example.com', '2025-02-26', 'Bola Akinwale', '07089012346'),
('Amara', 'Okoye', '2005-08-12', 'Female', '12 Hunbe Lane, Badagry', '08156789014', 'amara.oko@example.com', '2025-02-27', 'Ifeanyi Okoye', '08123456782'),
('Ismail', 'Danjuma', '2004-11-19', 'Male', '21 Agbalumo Street, Badagry', '09023456781', 'ismail.dan@example.com', '2025-02-28', 'Aminat Danjuma', '09090123457'),
('Funmi', 'Odetola', '2006-03-04', 'Female', '8 Posukoh Road, Badagry', '08034567892', 'funmi.ode@example.com', '2025-03-01', 'Segun Odetola', '08067890125'),
('Chinedu', 'Ekwueme', '2005-09-28', 'Male', '16 Finny Quarters, Badagry', '07034567892', 'chinedu.ekw@example.com', '2025-03-02', 'Ada Ekwueme', '07090123457'),
('Maryam', 'Suleiman', '2007-02-16', 'Female', '11 Gbaji Lane, Badagry', '08167890125', 'maryam.sul@example.com', '2025-03-03', 'Ibrahim Suleiman', '08123456783'),
('Wale', 'Ogunsola', '2006-05-09', 'Male', '20 Oba Owo Road, Badagry', '09034567892', 'wale.ogu@example.com', '2025-03-04', 'Temi Ogunsola', '09067890125'),
('Ify', 'Okafor', '2005-12-24', 'Female', '9 Jegba Lane, Badagry', '08045678903', 'ify.oka@example.com', '2025-03-05', 'Emeka Okafor', '08090123458'),
('Umar', 'Haruna', '2004-10-11', 'Male', '23 Mowo Quarters, Badagry', '07045678903', 'umar.har@example.com', '2025-03-06', 'Hauwa Haruna', '07056789015'),
('Temitope', 'Adewunmi', '2006-07-03', 'Female', '14 Agbara Street, Badagry', '08178901236', 'temitope.ade@example.com', '2025-03-07', 'Dele Adewunmi', '08123456784'),
('Chijioke', 'Okoli', '2005-04-19', 'Male', '18 Apa Lane, Badagry', '09045678903', 'chijioke.oko@example.com', '2025-03-08', 'Nkechi Okoli', '09090123458'),
('Raliat', 'Mustapha', '2007-01-08', 'Female', '7 Doven Road, Badagry', '08056789014', 'raliat.mus@example.com', '2025-03-09', 'Sani Mustapha', '08023456782'),
('Gbenga', 'Olowookere', '2006-09-15', 'Male', '22 Hunbe Street, Badagry', '07056789014', 'gbenga.olo@example.com', '2025-03-10', 'Funke Olowookere', '07090123458'),
('Ngozi', 'Anambra', '2005-06-30', 'Female', '10 Oke Oko Lane, Badagry', '08190123458', 'ngozi.ana@example.com', '2025-03-11', 'Chukwuma Anambra', '08167890126'),
('Sadiq', 'Abubakar', '2004-12-02', 'Male', '19 Toga Quarters, Badagry', '09056789014', 'sadiq.abu@example.com', '2025-03-12', 'Aisha Abubakar', '09023456782'),
('Yemisi', 'Akindele', '2006-02-17', 'Female', '13 Magbon Road, Badagry', '08067890126', 'yemisi.aki@example.com', '2025-03-13', 'Tunde Akindele', '08034567893'),
('Obi', 'Nwadike', '2005-11-04', 'Male', '21 Gbaji Street, Badagry', '07067890126', 'obi.nwa@example.com', '2025-03-14', 'Amaka Nwadike', '07090123459'),
('Halima', 'Yusuf', '2007-03-20', 'Female', '8 Isalu Lane, Badagry', '08123456784', 'halima.yus@example.com', '2025-03-15', 'Musa Yusuf', '08189012347'),
('Deji', 'Ogunlade', '2006-08-26', 'Male', '16 Oba Akran Road, Badagry', '09067890126', 'deji.ogu@example.com', '2025-03-16', 'Bola Ogunlade', '09034567893'),
('Nneka', 'Ezeala', '2005-05-13', 'Female', '12 Apa Quarters, Badagry', '08090123459', 'nneka.eze@example.com', '2025-03-17', 'Chidi Ezeala', '08056789015');

-- Sample data for courses
INSERT INTO courses (course_name, course_description, start_date, end_date, instructor_name, capacity) VALUES
('Computer Literacy', 'Basic computer skills and MS Office', '2025-02-01', '2025-04-30', 'Mr. Tunde Adekunle', 25),
('Entrepreneurship', 'Introduction to business and startups', '2025-02-15', '2025-05-15', 'Mrs. Ngozi Eze', 20);

-- Sample data for enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-01-15', 'Active'),
(2, 1, '2025-01-15', 'Active'),
(3, 1, '2025-01-16', 'Active'),
(4, 1, '2025-01-16', 'Active'),
(5, 1, '2025-01-17', 'Active'),
(6, 1, '2025-01-17', 'Active'),
(7, 1, '2025-01-18', 'Active'),
(8, 1, '2025-01-18', 'Active'),
(9, 1, '2025-01-19', 'Active'),
(10, 1, '2025-01-19', 'Active'),
(11, 1, '2025-01-20', 'Active'),
(12, 1, '2025-01-20', 'Active'),
(13, 1, '2025-01-21', 'Active'),
(14, 1, '2025-01-21', 'Active'),
(15, 1, '2025-01-22', 'Active'),
(16, 1, '2025-01-22', 'Active'),
(17, 1, '2025-01-23', 'Active'),
(18, 1, '2025-01-23', 'Active'),
(19, 1, '2025-01-24', 'Active'),
(20, 1, '2025-01-24', 'Active'),
(21, 2, '2025-01-25', 'Active'),
(22, 2, '2025-01-25', 'Active'),
(23, 2, '2025-01-26', 'Active'),
(24, 2, '2025-01-26', 'Active'),
(25, 2, '2025-01-27', 'Active'),
(26, 2, '2025-01-27', 'Active'),
(27, 2, '2025-01-28', 'Active'),
(28, 2, '2025-01-28', 'Active'),
(29, 2, '2025-01-29', 'Active'),
(30, 2, '2025-01-29', 'Active');


-- Sample data for attendance
INSERT INTO attendance (student_id, course_id, attendance_date, status) VALUES
(1, 1, '2025-02-01', 'Present'),
(2, 1, '2025-02-01', 'Absent'),
(3, 1, '2025-02-01', 'Present'),
(4, 1, '2025-02-01', 'Present'),
(5, 1, '2025-02-01', 'Excused'),
(6, 1, '2025-02-01', 'Present'),
(7, 1, '2025-02-01', 'Present'),
(8, 1, '2025-02-01', 'Absent'),
(9, 1, '2025-02-01', 'Present'),
(10, 1, '2025-02-01', 'Present'),
(11, 1, '2025-02-01', 'Present'),
(12, 1, '2025-02-01', 'Excused'),
(13, 1, '2025-02-01', 'Present'),
(14, 1, '2025-02-01', 'Present'),
(15, 1, '2025-02-01', 'Absent'),
(16, 1, '2025-02-01', 'Present'),
(17, 1, '2025-02-01', 'Present'),
(18, 1, '2025-02-01', 'Present'),
(19, 1, '2025-02-01', 'Present'),
(20, 1, '2025-02-01', 'Present'),
(21, 2, '2025-02-15', 'Present'),
(22, 2, '2025-02-15', 'Absent'),
(23, 2, '2025-02-15', 'Present'),
(24, 2, '2025-02-15', 'Present'),
(25, 2, '2025-02-15', 'Excused'),
(26, 2, '2025-02-15', 'Present'),
(27, 2, '2025-02-15', 'Present'),
