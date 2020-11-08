-- Challenge 1
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tl.title,
	tl.from_date,
	tl.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS tl
ON (e.emp_no = tl.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no

-- Use Dictinct with Orderby to remove duplicate rows
-- Challenge1 part b
SELECT DISTINCT ON (emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

-- Show unique titles
SELECT * FROM unique_titles;


-- Number of employees by their most recent job title

SELECT COUNT (utl.emp_no), utl.title
INTO retiring_titles
FROM unique_titles AS utl
GROUP BY title
ORDER BY COUNT DESC;

-- Show unique titles
SELECT * FROM retiring_titles;


-- Challenge 2
SELECT DISTINCT ON (emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tl.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS tl
ON (e.emp_no = tl.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

-- Show mentorship_eligibility
SELECT * FROM mentorship_eligibility;