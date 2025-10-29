---this is the code for creating tables

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    managerId INT
);

INSERT INTO Employee (id, name, department, managerId) VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);


-- this is the solution

# Write your MySQL query statement below
with countofppl
as 
(
    select 
        managerId
    from 
        Employee
    group by 
        managerId
    having 
        count(id) >= 5 
),
name_of_ppl as
(
    select name, id
    from Employee
)
-- join part
select n.name
from name_of_ppl n 
inner join 
countofppl c 
on n.id = c.managerId;
