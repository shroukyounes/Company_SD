 use Company_SD
 select* FROM Employee
SELECT * FROM Departments
SELECT * FROM Works_for
SELECT *FROM Project
SELECT *FROM Dependent
---1- Retrieve all employees who work in the "Sales" department (Dname = 'Sales'), have a salary greater than 50,000, 
--and are male (Sex = 'M').
SELECT DNAME,SALARY 
FROM Departments join Employee
on  Departments .Dnum = Employee.Dno
WHERE Dname='dp3' AND Salary>=1000 and sex='male'


---2- Retrieve a list of unique department names from the Departments table.

select distinct (dname)
from departments


--3- Group employees by their department and show the average salary for each department.

select dname,avg(salary)avg_salary
from employee e join departments d
 ON D.Dnum  =e.dno 
group by dname 


--4- Find departments where the average salary is greater than 1200)
select dname ,avg (salary)avg_S
 from employee e join departments d
 ON D.Dnum  =e.dno 
 group by dname
having  avg (salary) >=1200

--- Find departments where the  salary >1600 if have dep or not 
select dname , salary
 from employee e full outer join departments d
 ON D.Dnum  =e.dno 
 where salary >=1600


--5- Retrieve the names and salaries of employees who work in departments 1, 2, or 3.
select fname+' '+lname'full_name',salary
  from employee e join departments d
 ON D.Dnum  =e.dno 
 where dname in ('dp1','dp2','dp3')


---6- Retrieve all projects that are located in cities between between 'alex' and 'giza', sorted alphabetically.
select pname ,city 
from project
where city in('alex' ,'giza')
order by pname


---7- Retrieve the count of employees grouped by their sex, but only show those groups that have more than 2 employees.
select sex ,count (*)#emp
from employee
group by sex
having count (*)>2



---8- Calculate the average salary in each department and only show departments where the average salary is more 
---than 1200

select dname,avg(salary)#avg
 from employee e join departments d
 ON D.Dnum  =e.dno 
 group by dname
 having avg(salary)>1200

---9- Retrieve the departments with more than 2 employees.
select dname, count (dno)#emp
from employee e join departments d
 ON D.Dnum  =e.dno 
 group by dname
 having count (dno)>= 2


--10- Retrieve the departments that have employees with salaries greater than 1800

select dname ,salary
from employee e join departments d
 ON D.Dnum  =e.dno 
 where salary >=1800


---11- Retrieve the average salary of employees in each department, but only show departments with more than 2
select dname , avg(salary)avg_s,count(dno)#emp
from employee e join departments d
 ON D.Dnum  =e.dno 
 group by dname 
 having count(dno)>=2

---12- Retrieve departments where the average salary is above 1200 and the number of employees is greater than 2.

select dname , avg(salary)avg_s,count(dno)#emp
from employee e join departments d
 ON D.Dnum  =e.dno 
 group by dname
having avg(salary) >=1200 and count(dno)>=2


---13- Retrieve all employees who were hired between January 1, 2006, and December 31-2024
select fname+' '+lname'full_name',[MGRStart Date]
from Employee e join Departments d
on e.Dno = d.Dnum
where [MGRStart Date]between '2006-1-1' and '2024-12-31'

--14- Retrieve employees with a salary between 1300 and  1800

select fname+' '+lname'full_name',salary
from Employee
where salary between 1300 and 1800


---15- Retrieve a list of unique employee names along with their department numbers.
select fname+' '+ lname 'full_name',dno
from Employee e join Departments d
on e.Dno = d.Dnum

--16- Retrieve employees who either have a salary above1300 or work in department 2. 
select fname+' '+lname'full_name', Salary
from Employee e  join Departments d
on e.Dno = d.Dnum
where  salary > 1300 or dname= 'dp2'

---17- Retrieve the distinct department locations, sorted alphabetically

select distinct  dname ,p.Plocation
from Departments d join Project p
on d. Dnum = p.Dnum
order by p.Plocation