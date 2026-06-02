-- Sample Queries for Library Management System

USE library_db;

-- 1. Show all books
SELECT * FROM books;

-- 2. Show all students
SELECT * FROM students;

-- 3. Show all issued books
SELECT * FROM book_issues WHERE status = 'Issued';

-- 4. Show books with fine
SELECT * FROM book_issues WHERE fine_amount > 0;

-- 5. Issue a book - student_id=1, book_id=1
CALL IssueBook(1, 1);

-- 6. Return a book - issue_id=1
CALL ReturnBook(1);

-- 7. Books issued by a student
SELECT b.title, bi.issue_date, bi.due_date, bi.status 
FROM book_issues bi 
JOIN books b ON bi.book_id = b.book_id 
WHERE bi.student_id = 1;

-- 8. Total fine collected
SELECT SUM(fine_amount) AS Total_Fine FROM book_issues;
