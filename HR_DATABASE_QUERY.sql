create database mca_lab;
use mca_lab;

create table emp(
	empno decimal(4, 0) primary key,
    ename varchar(10) default null,
    job varchar(10) default null,
    mgr decimal(4, 0) default null,
    hiredate date default null,
    sal decimal(7,2) default null,
    com decimal(7,2) default null,
    deptno decimal(2, 0) default null
);

CREATE TABLE dept(
	deptno decimal(2,0) default NULL,
    dname varchar(14) default NULL,
    loc varchar(13) default NULL);

show tables;

create table SALGRADE(
	GRADE int primary key,
    LOSAL int(14) default NULL,
    HISAL varchar(13) default NULL);
    
drop database mca_lab;

INSERT INTO dept VALUES (10, 'ACCOUNTING', 'NEW YORK'), 
	(20, 'RESEARCH', 'DALLAS'),
	(30, 'SALES', 'CHICAGO'),
	(40, 'OPERATIONS', 'BOSTON');

INSERT INTO emp VALUES
	(7369, 'SMITH', 'CLERK', 7902, STR_TO_DATE('17-DEC-80','%d-%b-%y'), 800, NULL, 20),
	(7499, 'ALLEN', 'SALESMAN', 7698, STR_TO_DATE('20-FEB-81','%d-%b-%y'), 1600, 300, 30),
	(7521, 'WARD', 'SALESMAN', 7698, STR_TO_DATE('22-FEB-81','%d-%b-%y'), 1250, 500, 30),
	(7566, 'JONES', 'MANAGER', 7839, STR_TO_DATE('02-APR-81','%d-%b-%y'), 2975, NULL, 20),
	(7654, 'MARTIN', 'SALESMAN', 7698, STR_TO_DATE('28-SEP-81','%d-%b-%y'), 1250, 1400, 30),
	(7698, 'BLAKE', 'MANAGER', 7839, STR_TO_DATE('01-MAY-81','%d-%b-%y'), 2850, NULL, 30),
	(7782, 'CLARK', 'MANAGER', 7839, STR_TO_DATE('09-JUN-81','%d-%b-%y'), 2450, NULL, 10),
	(7788, 'SCOTT', 'ANALYST', 7566, STR_TO_DATE('19-APR-87','%d-%b-%y'), 3000, NULL, 20),
	(7839, 'KING', 'PRESIDENT', NULL, STR_TO_DATE('17-NOV-81','%d-%b-%y'), 5000, NULL, 10),
	(7844, 'TURNER', 'SALESMAN', 7698, STR_TO_DATE('08-SEP-81','%d-%b-%y'), 1500, 0, 30),
	(7876, 'ADAMS', 'CLERK', 7788, STR_TO_DATE('23-MAY-87','%d-%b-%y'), 1100, NULL, 20),
	(7900, 'JAMES', 'CLERK', 7698, STR_TO_DATE('03-DEC-81','%d-%b-%y'), 950, NULL, 30),
	(7902, 'FORD', 'ANALYST', 7566, STR_TO_DATE('03-DEC-81','%d-%b-%y'), 3000, NULL, 20),
	(7934, 'MILLER', 'CLERK', 7782, STR_TO_DATE('23-JAN-82','%d-%b-%y'), 1300, NULL, 10);

INSERT INTO salgrade VALUES
	(1, 700, 1200),
	(2, 1201, 1400),
	(3, 1401, 2000),
	(4, 2001, 3000),
	(5, 3001, 9999);
    
SELECT * FROM dept;
SELECT * FROM emp;
SELECT * FROM salgrade;



SELECT * FROM emp;
SELECT ename, sal FROM emp;
SELECT ename, deptno FROM emp;
SELECT DISTINCT job FROM emp;
SELECT * FROM emp WHERE deptno = 30;
SELECT * FROM emp WHERE sal > 2000;
SELECT * FROM emp WHERE hiredate > STR_TO_DATE('01-JAN-1981', '%d-%b-%Y');
SELECT * FROM emp WHERE ename LIKE 'S%';
SELECT * FROM emp WHERE comm IS NOT NULL AND comm > 0;
SELECT * FROM emp WHERE deptno IN (10, 20);
SELECT * FROM emp ORDER BY sal DESC;
SELECT ename, sal, comm FROM emp ORDER BY ename;
SELECT * FROM emp WHERE mgr IS NULL;
SELECT loc FROM dept WHERE deptno = 20;
SELECT * FROM dept ORDER BY dname;
SELECT * FROM emp WHERE sal BETWEEN 1000 AND 3000;
SELECT COUNT(*) AS total_employees FROM emp;
SELECT MIN(sal) AS min_salary, MAX(sal) AS max_salary FROM emp;
SELECT job, COUNT(*) AS total_employees FROM emp GROUP BY job;
SELECT CURDATE() AS current_date;

select ename, sal, (sal*12) as year_sal from emp;
select * from emp where year(hiredate)='1981';
select * from emp order by hiredate desc;
select deptno, avg(sal) from emp group by deptno;
select emp.ename, dept.dname from emp inner join dept;
select * from emp where sal > (select avg(sal) from emp);
select deptno, ename from emp where comm>0;
select * from emp where ename like '%a%';
select max(sal), job from emp group by job;

select e.ename, e.deptno, d.dname
from emp e
inner join dept d
on e.deptno = d.deptno
where d.loc = 'NEW YORK';

select * from emp where weekday(hiredate)='monday';
select count(*) from emp where comm is NULL;
select job, sum(com) as total_comm from emp group by job;
select dept.dname, count(*) from dept group by dname;
select ename, sal from emp where sal = (select max(sal) from emp where sal < (select max(sal) from emp));
select * from emp where job = (select job from emp where ename='SMITH');
select e.ename, e.sal, s.grade from emp e join salgrade s on e.sal between s.losal and s.hisal;
select e.ename, e.sal, s.grade from emp e join salgrade s on e.sal between s.losal and s.hisal;
select * from emp where job='manager';
select * from emp where deptno=30 and sal=(select max(sal) from emp where deptno=30);
-- 41
select * from emp where sal=(select max(sal) from emp);
select * from emp e where sal > (select avg(sal) from emp where deptno = e.deptno);
select deptno, sum(sal) as total_sal from emp group by deptno order by total_sal desc limit 1;
select e.ename from emp e join emp m on e.mgr = m.empno where e.hiredate < m.hiredate;
select * from dept where deptno not in (select distinct deptno from emp);
select distinct sal from emp order by sal limit 2,1;
select monthname(hiredate), count(empno) from emp group by monthname(hiredate);
select * from emp where hiredate > (select hiredate from emp where ename="FORD");
select * from emp where deptno not in (select deptno from dept);
select job, max(sal) - min(sal) as salary_difference from emp group by job;
-- 51
select ename, length(ename) from emp;
select round(sal, 3) as formatted from emp;
select ename, concat(left(ename, 3), repeat('*', length(ename) - 3)) as mn from emp;
select ename, ifnull(com, 'No commission') as commission from emp;

create view emp_details_view as
select e.ename, e.sal, d.dname from emp e join dept d on e.deptno = d.deptno;
select * from emp_details_view;

update emp set sal = sal*1.10 where deptno=30;
delete from emp where deptno is NULL;
insert into dept(deptno, dname) values (50, 'HR');

select * from emp;
select ename from emp where deptno = (select deptno from emp where ename='BLAKE');

-- 60
select ename, job from emp where job in (select job from emp group by job having count(*) > 1);
select * from emp where sal > (select max(sal) from emp where deptno=10);
select * from emp where sal > (select max(sal) from emp where deptno=30);
select deptno from emp group by deptno having min(com)>0;

SELECT e.ename, e.sal, e.deptno
FROM emp e
WHERE e.sal = (
    SELECT AVG(sal)
    FROM emp
    WHERE deptno = e.deptno
);

select job, ename, sal from emp where sal < (select avg(sal) from emp e where e.job = job);
select job, ename, sal from emp where sal in (select min(sal) from emp e where e.job = job group by job);

select e.ename from emp e where e.deptno in (
	select d.deptno from dept d where d.loc = (
		select d2.loc from emp e2 join dept d2 on e2.deptno = d2.deptno
        where e2.ename='KING'
	)
);
        
select ename, sal, grade from emp, salgrade where sal not between losal and hisal;

select e.ename, e.sal, e.deptno
from emp e
where sal = (
    select distinct sal
    from emp
    where deptno = e.deptno
    order by sal desc
    limit 1 offset 1
);

select e.ename, e.deptno from emp e where e.deptno in (select deptno from emp where job="MANAGER");

select deptno, dname 
from dept 
where deptno not in (select distinct deptno from emp where job = "MANAGER");

select ename, sal from emp where sal between (
	select losal from salgrade where grade = (select max(grade) from salgrade)
) and (
	select hisal from salgrade where grade = (select max(grade) from salgrade)
);

-- 73
select e1.ename, e1.deptno from emp e1 
where exists ( select 1 from emp e2 where e1.sal = e2.sal and e1.deptno != e2.deptno);

select ename, deptno, hiredate from emp e where hiredate = (select min(hiredate) from emp where deptno = e.deptno);


select deptno, count(*)
from emp
group by deptno;


select e.ename as employee, m.ename as manager from emp e 
join emp m on e.mgr = m.empno
join dept d1 on e.deptno = d1.deptno
join dept d2 on m.deptno = d2.deptno
where d1.loc != d2.loc;

select ename, sal from emp where deptno = (select deptno from emp group by deptno order by sum(sal) desc limit 1);

select e.ename, d.dname from emp e join dept d on e.deptno = d.deptno where e.sal > (
	select avg(sal) from emp where job="MANAGER");
    
select d.dname, e.ename from emp e
join emp m on e.mgr = m.empno
join dept d on e.deptno = d.deptno
where e.sal > m.sal;

select e.ename, e.sal, d.dname from emp e
join dept d on e.deptno = d.deptno
join salgrade s on s.grade = 3
where e.sal between s.losal and s.hisal;

commit;