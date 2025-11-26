-- ==========================================================
--  Hospital Database Schema
--  Author: Your Name
--  File: schema.sql
--  Description: Full schema for the Hospital DB project
-- ==========================================================

-- Create database
CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

-- ==========================================================
-- 1. Departments Table
-- ==========================================================
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- ==========================================================
-- 2. Patients Table
-- ==========================================================
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL
);

-- ==========================================================
-- 3. Doctors Table
-- ==========================================================
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT NOT NULL,
    phone VARCHAR(20),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- ==========================================================
-- 4. Appointments Table
-- ==========================================================
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason VARCHAR(255),
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- ==========================================================
-- 5. Medical Records Table
-- ==========================================================
CREATE TABLE medical_records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    diagnosis VARCHAR(255) NOT NULL,
    treatment VARCHAR(255),
    record_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- ==========================================================
-- END OF SCHEMA
-- ==========================================================
