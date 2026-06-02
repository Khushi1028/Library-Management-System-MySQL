-- Library Management System - Sample Queries

USE library_db;

-- INSERT Sample Data
INSERT INTO students (name, email, phone, class, roll_no) VALUES
('Rahul Sharma', 'rahul@email.com', '9876543210', '10th', 'A101'),
('Priya Singh', 'priya@email.com', '9876543211', '12th', 'B205');

INSERT INTO books (title, author, isbn, category, total_copies, available_copies) VALUES
('Let Us C', 'Yashavant Kanetkar', '9788176566219', 'Programming', 5, 5),
('Wings of Fire', 'A.P.J. Abdul Kalam', '9788173711466', 'Biography', 3, 3);

-- SELECT Queries
-- 1. Sabhi books dikhao
SELECT * FROM books;

-- 2. Sabhi students dikhao  
SELECT * FROM students;

-- 3. Kaunsi books issue hain abhi
SELECT b.title, s.name, bi.issue_date, bi.due_date 
FROM book_issues bi
JOIN books b ON bi.book_id = b.book_id
JOIN students s ON bi.student_id = s.student_id
WHERE bi.status = 'Issued';

-- 4. Kitna fine collect hua total
SELECT SUM(fine_amount) AS Total_Fine_Collected FROM book_issues;

-- CALL Procedures - Demo
-- Book issue karo: student_id=1, book_id=1
CALL IssueBook(1, 1);

-- Book return karo: issue_id=1  
CALL ReturnBook(1);

-- 5. Overdue books - jinka fine lagega
SELECT b.title, s.name, bi.due_date, DATEDIFF(CURDATE(), bi.due_date) AS Days_Late
FROM book_issues bi
JOIN books b ON bi.book_id = b.book_id
JOIN students s ON bi.student_id = s.student_id
WHERE bi.status = 'Issued' AND CURDATE() > bi.due_date;
