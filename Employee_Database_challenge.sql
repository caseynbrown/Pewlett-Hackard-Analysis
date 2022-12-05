--Create retirement_titles table
SELECT E.emp_no
	,E.first_name
	,E.last_name
	,T.title
	,T.from_date
	,T.to_date
INTO retirement_titles
FROM employees E
JOIN titles T
ON E.emp_no= T.emp_no
WHERE (E.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY E.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

--Retrieve the number of employees by their most recent job title who are about to retire. 
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retirement_titles