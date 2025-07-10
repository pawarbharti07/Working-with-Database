/*create database db;*/
use db;

/*===============CREATE TABLES=================*/
/*create table salesman(
	salesman_id int primary key,
    name varchar(50),
    city varchar(10),
    commission float
);

create table customer(
	customer_id int PRIMARY KEY,
    cust_name varchar(50),
    city varchar(10),
    grade int,
	salesman_id int,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

create table orders(
	ord_no int PRIMARY KEY,
    purch_amt float,
    ord_date date,
    customer_id int,
    salesman_id int,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

create table item_mast(
	pro_id int,
    pro_name varchar(50),
    pro_price float,
    pro_com int
);

create table emp_details(
	emp_id int,
    emp_fname varchar(50),
    emp_lname varchar(50),
    emp_dept int
);

CREATE TABLE regions (
	region_id INT (11) UNSIGNED NOT NULL,
	region_name VARCHAR(25),
	PRIMARY KEY (region_id)
	);

CREATE TABLE countries (
	country_id CHAR(2) NOT NULL,
	country_name VARCHAR(40),
	region_id INT (11) UNSIGNED NOT NULL,
	PRIMARY KEY (country_id)
);


CREATE TABLE locations (
	location_id INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
	street_address VARCHAR(40),
	postal_code VARCHAR(12),
	city VARCHAR(30) NOT NULL,
	state_province VARCHAR(25),
	country_id CHAR(2) NOT NULL,
	PRIMARY KEY (location_id)
	);

CREATE TABLE departments (
	department_id INT (11) UNSIGNED NOT NULL,
	department_name VARCHAR(30) NOT NULL,
	manager_id INT (11) UNSIGNED,
	location_id INT (11) UNSIGNED,
	PRIMARY KEY (department_id)
	);

CREATE TABLE jobs (
	job_id VARCHAR(10) NOT NULL,
	job_title VARCHAR(35) NOT NULL,
	min_salary DECIMAL(8, 0) UNSIGNED,
	max_salary DECIMAL(8, 0) UNSIGNED,
	PRIMARY KEY (job_id)
	);

CREATE TABLE employees (
	employee_id INT (11) UNSIGNED NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(25) NOT NULL,
	email VARCHAR(25) NOT NULL,
	phone_number VARCHAR(20),
	hire_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	salary DECIMAL(8, 2) NOT NULL,
	commission_pct DECIMAL(2, 2),
	manager_id INT (11) UNSIGNED,
	department_id INT (11) UNSIGNED,
	PRIMARY KEY (employee_id)
	);

CREATE TABLE job_history (
	employee_id INT (11) UNSIGNED NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	department_id INT (11) UNSIGNED NOT NULL
);

ALTER TABLE job_history ADD UNIQUE INDEX (
	employee_id,
	start_date
	);

CREATE VIEW emp_details_view
AS
SELECT e.employee_id,
	e.job_id,
	e.manager_id,
	e.department_id,
	d.location_id,
	l.country_id,
	e.first_name,
	e.last_name,
	e.salary,
	e.commission_pct,
	d.department_name,
	j.job_title,
	l.city,
	l.state_province,
	c.country_name,
	r.region_name
FROM employees e,
	departments d,
	jobs j,
	locations l,
	countries c,
	regions r
WHERE e.department_id = d.department_id
	AND d.location_id = l.location_id
	AND l.country_id = c.country_id
	AND c.region_id = r.region_id
	AND j.job_id = e.job_id;
*/

/*==========================INSERT TABLES======================*/
/*insert into salesman values(5001,'James Hoog','New York',0.15);
insert into salesman values(5002,'Nail Knite','Paris',0.13);
insert into salesman values(5005,'Pit Alex','London',0.11);
insert into salesman values(5006,'Mc Lyon','Paris',0.14);
insert into salesman values(5007,'Paul Adam','Rome',0.13);
insert into salesman values(5003,'Lauson Hen','San Jose',0.12);

insert into customer values(3002,'Nick Rimando','New York',100,5001);
insert into customer values(3007,'Brad Davis','New York',200,5001);
insert into customer values(3005,'Graham Zusi','California',200,5002);
insert into customer values(3008,'Julian Green','London',300,5002);
insert into customer values(3004,'Fabian Johnson','Paris',300,5006);
insert into customer values(3009,'Geoff Cameron','Berlin',100,5003);
insert into customer values(3003,'Jozy Altidor','Moscow',200,5007);
insert into customer values(3001,'Brad Guzan','London',NULL,5005);

insert into orders values(70001,150.5,'2012-10-05',3005,5002);
insert into orders values(70009,270.65,'2012-09-10',3001,5005);
insert into orders values(70002,65.26,'2012-10-05',3002,5001);
insert into orders values(70004,110.5,'2012-08-17',3009,5003);
insert into orders values(70007,948.5,'2012-09-10',3005,5002);
insert into orders values(70005,2400.6,'2012-07-27',3007,5001);
insert into orders values(70008,5760,'2012-09-10',3002,5001);
insert into orders values(70010,1983.43,'2012-10-10',3004,5006);
insert into orders values(70003,2480.4,'2012-10-10',3009,5003);
insert into orders values(70012,250.45,'2012-06-27',3008,5002);
insert into orders values(70011,75.29,'2012-08-17',3003,5007);
insert into orders values(70013,3045.6,'2012-04-25',3002,5001);

insert into emp_details values(127323,'Michale','Robbin',57);
insert into emp_details values(526689,'Carlos','Snares',63);
insert into emp_details values(843795,'Enric','Dosio',57);
insert into emp_details values(328717,'Jhon','Snares',63);
insert into emp_details values(444527,'Joseph','Dosni',47);
insert into emp_details values(659831,'Zanifer','Emily',47);
insert into emp_details values(847674,'Kuleswar','Sitaraman',57);
insert into emp_details values(748681,'Henrey','Gabriel',47);
insert into emp_details values(555935,'Alex','Manuel',57);
insert into emp_details values(539569,'George','Mardy',27);
insert into emp_details values(733843,'Mario','Saule',63);
insert into emp_details values(631548,'Alan','Snappy',27);
insert into emp_details values(839139,'Maria','Foster',57);

insert into item_mast values(101,'Motherboard',3200.00,15);
insert into item_mast values(102,'Keyboard',450.00,16);
insert into item_mast values(103,'ZIP drive',250.00,14);
insert into item_mast values(104,'Speaker',550.00,16);
insert into item_mast values(105,'Monitor',5000.00,11);
insert into item_mast values(106,'DVD drive',900.00,12);
insert into item_mast values(107,'CD drive',800.00,12);
insert into item_mast values(108,'Printer',2600.00,13);
insert into item_mast values(109,'Refill cartridge',350.00,13);
insert into item_mast values(110,'Mouse',250.00,12);

INSERT INTO regions VALUES (1,'Europe');
INSERT INTO regions VALUES (2,'Americas');
INSERT INTO regions VALUES (3,'Asia');
INSERT INTO regions VALUES (4,'Middle East and Africa');
COMMIT;

INSERT INTO countries VALUES ('IT','Italy',1);
INSERT INTO countries VALUES ('JP','Japan',3);
INSERT INTO countries VALUES ('US','United States of America',2);
INSERT INTO countries VALUES ('CA','Canada',2);
INSERT INTO countries VALUES ('CN','China',3);
INSERT INTO countries VALUES ('IN','India',3);
INSERT INTO countries VALUES ('AU','Australia',3);
INSERT INTO countries VALUES ('ZW','Zimbabwe',4);
INSERT INTO countries VALUES ('SG','Singapore',3);
INSERT INTO countries VALUES ('UK','United Kingdom',1);
INSERT INTO countries VALUES ('FR','France',1);
INSERT INTO countries VALUES ('DE','Germany',1);
INSERT INTO countries VALUES ('ZM','Zambia',4);
INSERT INTO countries VALUES ('EG','Egypt',4);
INSERT INTO countries VALUES ('BR','Brazil',2);
INSERT INTO countries VALUES ('CH','Switzerland',1);
INSERT INTO countries VALUES ('NL','Netherlands',1);
INSERT INTO countries VALUES ('MX','Mexico',2);
INSERT INTO countries VALUES ('KW','Kuwait',4);
INSERT INTO countries VALUES ('IL','Israel',4);
INSERT INTO countries VALUES ('DK','Denmark',1);
INSERT INTO countries VALUES ('HK','HongKong',3);
INSERT INTO countries VALUES ('NG','Nigeria',4);
INSERT INTO countries VALUES ('AR','Argentina',2);
INSERT INTO countries VALUES ('BE','Belgium',1);

COMMIT;
INSERT INTO locations VALUES (1000,'1297 Via Cola di Rie','00989','Roma',NULL,'IT');
INSERT INTO locations VALUES (1100,'93091 Calle della Testa','10934','Venice',NULL,'IT');
INSERT INTO locations VALUES (1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
INSERT INTO locations VALUES (1300,'9450 Kamiya-cho','6823','Hiroshima',NULL,'JP');
INSERT INTO locations VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations VALUES (1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US');
INSERT INTO locations VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations VALUES (1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
INSERT INTO locations VALUES (2000,'40-5-12 Laogianggen','190518','Beijing',NULL,'CN');
INSERT INTO locations VALUES (2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
INSERT INTO locations VALUES (2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU');
INSERT INTO locations VALUES (2300,'198 Clementi North','540198','Singapore',NULL,'SG');
INSERT INTO locations VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations VALUES (2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK');
INSERT INTO locations VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
INSERT INTO locations VALUES (2800,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
INSERT INTO locations VALUES (2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
INSERT INTO locations VALUES (3000,'Murtenstrasse 921','3095','Bern','BE','CH');
INSERT INTO locations VALUES (3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
INSERT INTO locations VALUES (3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
COMMIT;

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO departments VALUES (10,'Administration',200,1700);
INSERT INTO departments VALUES (20,'Marketing',201,1800);
INSERT INTO departments VALUES (30,'Purchasing',114,1700);
INSERT INTO departments VALUES (40,'Human Resources',203,2400);
INSERT INTO departments VALUES (50,'Shipping',121,1500);
INSERT INTO departments VALUES (60,'IT',103,1400);
INSERT INTO departments VALUES (70,'Public Relations',204,2700);
INSERT INTO departments VALUES (80,'Sales',145,2500);
INSERT INTO departments VALUES (90,'Executive',100,1700);
INSERT INTO departments VALUES (100,'Finance',108,1700);
INSERT INTO departments VALUES (110,'Accounting',205,1700);
INSERT INTO departments VALUES (120,'Treasury',NULL,1700);
INSERT INTO departments VALUES (130,'Corporate Tax',NULL,1700);
INSERT INTO departments VALUES (140,'Control And Credit',NULL,1700);
INSERT INTO departments VALUES (150,'Shareholder Services',NULL,1700);
INSERT INTO departments VALUES (160,'Benefits',NULL,1700);
INSERT INTO departments VALUES (170,'Manufacturing',NULL,1700);
INSERT INTO departments VALUES (180,'Construction',NULL,1700);
INSERT INTO departments VALUES (190,'Contracting',NULL,1700);
INSERT INTO departments VALUES (200,'Operations',NULL,1700);
INSERT INTO departments VALUES (210,'IT Support',NULL,1700);
INSERT INTO departments VALUES (220,'NOC',NULL,1700);
INSERT INTO departments VALUES (230,'IT Helpdesk',NULL,1700);
INSERT INTO departments VALUES (240,'Government Sales',NULL,1700);
INSERT INTO departments VALUES (250,'Retail Sales',NULL,1700);
INSERT INTO departments VALUES (260,'Recruiting',NULL,1700);
INSERT INTO departments VALUES (270,'Payroll',NULL,1700);

SET FOREIGN_KEY_CHECKS = 1;

COMMIT;

INSERT INTO jobs VALUES ('AD_PRES','President',20000,40000);
INSERT INTO jobs VALUES ('AD_VP','Administration Vice President',15000,30000);
INSERT INTO jobs VALUES ('AD_ASST','Administration Assistant',3000,6000);
INSERT INTO jobs VALUES ('FI_MGR','Finance Manager',8200,16000);
INSERT INTO jobs VALUES ('FI_ACCOUNT','Accountant',4200,9000);
INSERT INTO jobs VALUES ('AC_MGR','Accounting Manager',8200,16000);
INSERT INTO jobs VALUES ('AC_ACCOUNT','Public Accountant',4200,9000);
INSERT INTO jobs VALUES ('SA_MAN','Sales Manager',10000,20000);
INSERT INTO jobs VALUES ('SA_REP','Sales Representative',6000,12000);
INSERT INTO jobs VALUES ('PU_MAN','Purchasing Manager',8000,15000);
INSERT INTO jobs VALUES ('PU_CLERK','Purchasing Clerk',2500,5500);
INSERT INTO jobs VALUES ('ST_MAN','Stock Manager',5500,8500);
INSERT INTO jobs VALUES ('ST_CLERK','Stock Clerk',2000,5000);
INSERT INTO jobs VALUES ('SH_CLERK','Shipping Clerk',2500,5500);
INSERT INTO jobs VALUES ('IT_PROG','Programmer',4000,10000);
INSERT INTO jobs VALUES ('MK_MAN','Marketing Manager',9000,15000);
INSERT INTO jobs VALUES ('MK_REP','Marketing Representative',4000,9000);
INSERT INTO jobs VALUES ('HR_REP','Human Resources Representative',4000,9000);
INSERT INTO jobs VALUES ('PR_REP','Public Relations Representative',4500,10500);

COMMIT;

INSERT INTO employees VALUES (100,'Steven','King','SKING','515.123.4567',STR_TO_DATE('17-JUN-1987', '%d-%M-%Y'),'AD_PRES',24000,NULL,NULL,90);
INSERT INTO employees VALUES (101,'Neena','Kochhar','NKOCHHAR','515.123.4568',STR_TO_DATE('21-SEP-1989', '%d-%M-%Y'),'AD_VP',17000,NULL,100,90);
INSERT INTO employees VALUES (102,'Lex','De Haan','LDEHAAN','515.123.4569',STR_TO_DATE('13-JAN-1993', '%d-%M-%Y'),'AD_VP',17000,NULL,100,90);
INSERT INTO employees VALUES (103,'Alexander','Hunold','AHUNOLD','590.423.4567',STR_TO_DATE('03-JAN-1990', '%d-%M-%Y'),'IT_PROG',9000,NULL,102,60);
INSERT INTO employees VALUES (104,'Bruce','Ernst','BERNST','590.423.4568',STR_TO_DATE('21-MAY-1991', '%d-%M-%Y'),'IT_PROG',6000,NULL,103,60);
INSERT INTO employees VALUES (105,'David','Austin','DAUSTIN','590.423.4569',STR_TO_DATE('25-JUN-1997', '%d-%M-%Y'),'IT_PROG',4800,NULL,103,60);
INSERT INTO employees VALUES (106,'Valli','Pataballa','VPATABAL','590.423.4560',STR_TO_DATE('05-FEB-1998', '%d-%M-%Y'),'IT_PROG',4800,NULL,103,60);
INSERT INTO employees VALUES (107,'Diana','Lorentz','DLORENTZ','590.423.5567',STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),'IT_PROG',4200,NULL,103,60);
INSERT INTO employees VALUES (108,'Nancy','Greenberg','NGREENBE','515.124.4569',STR_TO_DATE('17-AUG-1994', '%d-%M-%Y'),'FI_MGR',12000,NULL,101,100);
INSERT INTO employees VALUES (109,'Daniel','Faviet','DFAVIET','515.124.4169',STR_TO_DATE('16-AUG-1994', '%d-%M-%Y'),'FI_ACCOUNT',9000,NULL,108,100);
INSERT INTO employees VALUES (110,'John','Chen','JCHEN','515.124.4269',STR_TO_DATE('28-SEP-1997', '%d-%M-%Y'),'FI_ACCOUNT',8200,NULL,108,100);
INSERT INTO employees VALUES (111,'Ismael','Sciarra','ISCIARRA','515.124.4369',STR_TO_DATE('30-SEP-1997', '%d-%M-%Y'),'FI_ACCOUNT',7700,NULL,108,100);
INSERT INTO employees VALUES (112,'Jose Manuel','Urman','JMURMAN','515.124.4469',STR_TO_DATE('07-MAR-1998', '%d-%M-%Y'),'FI_ACCOUNT',7800,NULL,108,100);
INSERT INTO employees VALUES (113,'Luis','Popp','LPOPP','515.124.4567',STR_TO_DATE('07-DEC-1999', '%d-%M-%Y'),'FI_ACCOUNT',6900,NULL,108,100);
INSERT INTO employees VALUES (114,'Den','Raphaely','DRAPHEAL','515.127.4561',STR_TO_DATE('07-DEC-1994', '%d-%M-%Y'),'PU_MAN',11000,NULL,100,30);
INSERT INTO employees VALUES (115,'Alexander','Khoo','AKHOO','515.127.4562',STR_TO_DATE('18-MAY-1995', '%d-%M-%Y'),'PU_CLERK',3100,NULL,114,30);
INSERT INTO employees VALUES (116,'Shelli','Baida','SBAIDA','515.127.4563',STR_TO_DATE('24-DEC-1997', '%d-%M-%Y'),'PU_CLERK',2900,NULL,114,30);
INSERT INTO employees VALUES (117,'Sigal','Tobias','STOBIAS','515.127.4564',STR_TO_DATE('24-JUL-1997', '%d-%M-%Y'),'PU_CLERK',2800,NULL,114,30);
INSERT INTO employees VALUES (118,'Guy','Himuro','GHIMURO','515.127.4565',STR_TO_DATE('15-NOV-1998', '%d-%M-%Y'),'PU_CLERK',2600,NULL,114,30);
INSERT INTO employees VALUES (119,'Karen','Colmenares','KCOLMENA','515.127.4566',STR_TO_DATE('10-AUG-1999', '%d-%M-%Y'),'PU_CLERK',2500,NULL,114,30);
INSERT INTO employees VALUES (120,'Matthew','Weiss','MWEISS','650.123.1234',STR_TO_DATE('18-JUL-1996', '%d-%M-%Y'),'ST_MAN',8000,NULL,100,50);
INSERT INTO employees VALUES (121,'Adam','Fripp','AFRIPP','650.123.2234',STR_TO_DATE('10-APR-1997', '%d-%M-%Y'),'ST_MAN',8200,NULL,100,50);
INSERT INTO employees VALUES (122,'Payam','Kaufling','PKAUFLIN','650.123.3234',STR_TO_DATE('01-MAY-1995', '%d-%M-%Y'),'ST_MAN',7900,NULL,100,50);
INSERT INTO employees VALUES (123,'Shanta','Vollman','SVOLLMAN','650.123.4234',STR_TO_DATE('10-OCT-1997', '%d-%M-%Y'),'ST_MAN',6500,NULL,100,50);
INSERT INTO employees VALUES (124,'Kevin','Mourgos','KMOURGOS','650.123.5234',STR_TO_DATE('16-NOV-1999', '%d-%M-%Y'),'ST_MAN',5800,NULL,100,50);
INSERT INTO employees VALUES (125,'Julia','Nayer','JNAYER','650.124.1214',STR_TO_DATE('16-JUL-1997', '%d-%M-%Y'),'ST_CLERK',3200,NULL,120,50);
INSERT INTO employees VALUES (126,'Irene','Mikkilineni','IMIKKILI','650.124.1224',STR_TO_DATE('28-SEP-1998', '%d-%M-%Y'),'ST_CLERK',2700,NULL,120,50);
INSERT INTO employees VALUES (127,'James','Landry','JLANDRY','650.124.1334',STR_TO_DATE('14-JAN-1999', '%d-%M-%Y'),'ST_CLERK',2400,NULL,120,50);
INSERT INTO employees VALUES (128,'Steven','Markle','SMARKLE','650.124.1434',STR_TO_DATE('08-MAR-2000', '%d-%M-%Y'),'ST_CLERK',2200,NULL,120,50);
INSERT INTO employees VALUES (129,'Laura','Bissot','LBISSOT','650.124.5234',STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),'ST_CLERK',3300,NULL,121,50);
INSERT INTO employees VALUES (130,'Mozhe','Atkinson','MATKINSO','650.124.6234',STR_TO_DATE('30-OCT-1997', '%d-%M-%Y'),'ST_CLERK',2800,NULL,121,50);
INSERT INTO employees VALUES (131,'James','Marlow','JAMRLOW','650.124.7234',STR_TO_DATE('16-FEB-1997', '%d-%M-%Y'),'ST_CLERK',2500,NULL,121,50);
INSERT INTO employees VALUES (132,'TJ','Olson','TJOLSON','650.124.8234',STR_TO_DATE('10-APR-1999', '%d-%M-%Y'),'ST_CLERK',2100,NULL,121,50);
INSERT INTO employees VALUES (133,'Jason','Mallin','JMALLIN','650.127.1934',STR_TO_DATE('14-JUN-1996', '%d-%M-%Y'),'ST_CLERK',3300,NULL,122,50);
INSERT INTO employees VALUES (134,'Michael','Rogers','MROGERS','650.127.1834',STR_TO_DATE('26-AUG-1998', '%d-%M-%Y'),'ST_CLERK',2900,NULL,122,50);
INSERT INTO employees VALUES (135,'Ki','Gee','KGEE','650.127.1734',STR_TO_DATE('12-DEC-1999', '%d-%M-%Y'),'ST_CLERK',2400,NULL,122,50);
INSERT INTO employees VALUES (136,'Hazel','Philtanker','HPHILTAN','650.127.1634',STR_TO_DATE('06-FEB-2000', '%d-%M-%Y'),'ST_CLERK',2200,NULL,122,50);
INSERT INTO employees VALUES (137,'Renske','Ladwig','RLADWIG','650.121.1234',STR_TO_DATE('14-JUL-1995', '%d-%M-%Y'),'ST_CLERK',3600,NULL,123,50);
INSERT INTO employees VALUES (138,'Stephen','Stiles','SSTILES','650.121.2034',STR_TO_DATE('26-OCT-1997', '%d-%M-%Y'),'ST_CLERK',3200,NULL,123,50);
INSERT INTO employees VALUES (139,'John','Seo','JSEO','650.121.2019',STR_TO_DATE('12-FEB-1998', '%d-%M-%Y'),'ST_CLERK',2700,NULL,123,50);
INSERT INTO employees VALUES (140,'Joshua','Patel','JPATEL','650.121.1834',STR_TO_DATE('06-APR-1998', '%d-%M-%Y'),'ST_CLERK',2500,NULL,123,50);
INSERT INTO employees VALUES (141,'Trenna','Rajs','TRAJS','650.121.8009',STR_TO_DATE('17-OCT-1995', '%d-%M-%Y'),'ST_CLERK',3500,NULL,124,50);
INSERT INTO employees VALUES (142,'Curtis','Davies','CDAVIES','650.121.2994',STR_TO_DATE('29-JAN-1997', '%d-%M-%Y'),'ST_CLERK',3100,NULL,124,50);
INSERT INTO employees VALUES (143,'Randall','Matos','RMATOS','650.121.2874',STR_TO_DATE('15-MAR-1998', '%d-%M-%Y'),'ST_CLERK',2600,NULL,124,50);
INSERT INTO employees VALUES (144,'Peter','Vargas','PVARGAS','650.121.2004',STR_TO_DATE('09-JUL-1998', '%d-%M-%Y'),'ST_CLERK',2500,NULL,124,50);
INSERT INTO employees VALUES (145,'John','Russell','JRUSSEL','011.44.1344.429268',STR_TO_DATE('01-OCT-1996', '%d-%M-%Y'),'SA_MAN',14000,.4,100,80);
INSERT INTO employees VALUES (146,'Karen','Partners','KPARTNER','011.44.1344.467268',STR_TO_DATE('05-JAN-1997', '%d-%M-%Y'),'SA_MAN',13500,.3,100,80);
INSERT INTO employees VALUES (147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278',STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),'SA_MAN',12000,.3,100,80);
INSERT INTO employees VALUES (148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268',STR_TO_DATE('15-OCT-1999', '%d-%M-%Y'),'SA_MAN',11000,.3,100,80);
INSERT INTO employees VALUES (149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',STR_TO_DATE('29-JAN-2000', '%d-%M-%Y'),'SA_MAN',10500,.2,100,80);
INSERT INTO employees VALUES (150,'Peter','Tucker','PTUCKER','011.44.1344.129268',STR_TO_DATE('30-JAN-1997', '%d-%M-%Y'),'SA_REP',10000,.3,145,80);
INSERT INTO employees VALUES (151,'David','Bernstein','DBERNSTE','011.44.1344.345268',STR_TO_DATE('24-MAR-1997', '%d-%M-%Y'),'SA_REP',9500,.25,145,80);
INSERT INTO employees VALUES (152,'Peter','Hall','PHALL','011.44.1344.478968',STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),'SA_REP',9000,.25,145,80);
INSERT INTO employees VALUES (153,'Christopher','Olsen','COLSEN','011.44.1344.498718',STR_TO_DATE('30-MAR-1998', '%d-%M-%Y'),'SA_REP',8000,.2,145,80);
INSERT INTO employees VALUES (154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668',STR_TO_DATE('09-DEC-1998', '%d-%M-%Y'),'SA_REP',7500,.2,145,80);
INSERT INTO employees VALUES (155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508',STR_TO_DATE('23-NOV-1999', '%d-%M-%Y'),'SA_REP',7000,.15,145,80);
INSERT INTO employees VALUES (156,'Janette','King','JKING','011.44.1345.429268',STR_TO_DATE('30-JAN-1996', '%d-%M-%Y'),'SA_REP',10000,.35,146,80);
INSERT INTO employees VALUES (157,'Patrick','Sully','PSULLY','011.44.1345.929268',STR_TO_DATE('04-MAR-1996', '%d-%M-%Y'),'SA_REP',9500,.35,146,80);
INSERT INTO employees VALUES (158,'Allan','McEwen','AMCEWEN','011.44.1345.829268',STR_TO_DATE('01-AUG-1996', '%d-%M-%Y'),'SA_REP',9000,.35,146,80);
INSERT INTO employees VALUES (159,'Lindsey','Smith','LSMITH','011.44.1345.729268',STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),'SA_REP',8000,.3,146,80);
INSERT INTO employees VALUES (160,'Louise','Doran','LDORAN','011.44.1345.629268',STR_TO_DATE('15-DEC-1997', '%d-%M-%Y'),'SA_REP',7500,.3,146,80);
INSERT INTO employees VALUES (161,'Sarath','Sewall','SSEWALL','011.44.1345.529268',STR_TO_DATE('03-NOV-1998', '%d-%M-%Y'),'SA_REP',7000,.25,146,80);
INSERT INTO employees VALUES (162,'Clara','Vishney','CVISHNEY','011.44.1346.129268',STR_TO_DATE('11-NOV-1997', '%d-%M-%Y'),'SA_REP',10500,.25,147,80);
INSERT INTO employees VALUES (163,'Danielle','Greene','DGREENE','011.44.1346.229268',STR_TO_DATE('19-MAR-1999', '%d-%M-%Y'),'SA_REP',9500,.15,147,80);
INSERT INTO employees VALUES (164,'Mattea','Marvins','MMARVINS','011.44.1346.329268',STR_TO_DATE('24-JAN-2000', '%d-%M-%Y'),'SA_REP',7200,.10,147,80);
INSERT INTO employees VALUES (165,'David','Lee','DLEE','011.44.1346.529268',STR_TO_DATE('23-FEB-2000', '%d-%M-%Y'),'SA_REP',6800,.1,147,80);
INSERT INTO employees VALUES (166,'Sundar','Ande','SANDE','011.44.1346.629268',STR_TO_DATE('24-MAR-2000', '%d-%M-%Y'),'SA_REP',6400,.10,147,80);
INSERT INTO employees VALUES (167,'Amit','Banda','ABANDA','011.44.1346.729268',STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),'SA_REP',6200,.10,147,80);
INSERT INTO employees VALUES (168,'Lisa','Ozer','LOZER','011.44.1343.929268',STR_TO_DATE('11-MAR-1997', '%d-%M-%Y'),'SA_REP',11500,.25,148,80);
INSERT INTO employees VALUES (169,'Harrison','Bloom','HBLOOM','011.44.1343.829268',STR_TO_DATE('23-MAR-1998', '%d-%M-%Y'),'SA_REP',10000,.20,148,80);
INSERT INTO employees VALUES (170,'Tayler','Fox','TFOX','011.44.1343.729268',STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),'SA_REP',9600,.20,148,80);
INSERT INTO employees VALUES (171,'William','Smith','WSMITH','011.44.1343.629268',STR_TO_DATE('23-FEB-1999', '%d-%M-%Y'),'SA_REP',7400,.15,148,80);
INSERT INTO employees VALUES (172,'Elizabeth','Bates','EBATES','011.44.1343.529268',STR_TO_DATE('24-MAR-1999', '%d-%M-%Y'),'SA_REP',7300,.15,148,80);
INSERT INTO employees VALUES (173,'Sundita','Kumar','SKUMAR','011.44.1343.329268',STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),'SA_REP',6100,.10,148,80);
INSERT INTO employees VALUES (174,'Ellen','Abel','EABEL','011.44.1644.429267',STR_TO_DATE('11-MAY-1996', '%d-%M-%Y'),'SA_REP',11000,.30,149,80);
INSERT INTO employees VALUES (175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266',STR_TO_DATE('19-MAR-1997', '%d-%M-%Y'),'SA_REP',8800,.25,149,80);
INSERT INTO employees VALUES (176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265',STR_TO_DATE('24-MAR-1998', '%d-%M-%Y'),'SA_REP',8600,.20,149,80);
INSERT INTO employees VALUES (177,'Jack','Livingston','JLIVINGS','011.44.1644.429264',STR_TO_DATE('23-APR-1998', '%d-%M-%Y'),'SA_REP',8400,.20,149,80);
INSERT INTO employees VALUES (178,'Kimberely','Grant','KGRANT','011.44.1644.429263',STR_TO_DATE('24-MAY-1999', '%d-%M-%Y'),'SA_REP',7000,.15,149,NULL);
INSERT INTO employees VALUES (179,'Charles','Johnson','CJOHNSON','011.44.1644.429262',STR_TO_DATE('04-JAN-2000', '%d-%M-%Y'),'SA_REP',6200,.10,149,80);
INSERT INTO employees VALUES (180,'Winston','Taylor','WTAYLOR','650.507.9876',STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),'SH_CLERK',3200,NULL,120,50);
INSERT INTO employees VALUES (181,'Jean','Fleaur','JFLEAUR','650.507.9877',STR_TO_DATE('23-FEB-1998', '%d-%M-%Y'),'SH_CLERK',3100,NULL,120,50);
INSERT INTO employees VALUES (182,'Martha','Sullivan','MSULLIVA','650.507.9878',STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),'SH_CLERK',2500,NULL,120,50);
INSERT INTO employees VALUES (183,'Girard','Geoni','GGEONI','650.507.9879',STR_TO_DATE('03-FEB-2000', '%d-%M-%Y'),'SH_CLERK',2800,NULL,120,50);
INSERT INTO employees VALUES (184,'Nandita','Sarchand','NSARCHAN','650.509.1876',STR_TO_DATE('27-JAN-1996', '%d-%M-%Y'),'SH_CLERK',4200,NULL,121,50);
INSERT INTO employees VALUES (185,'Alexis','Bull','ABULL','650.509.2876',STR_TO_DATE('20-FEB-1997', '%d-%M-%Y'),'SH_CLERK',4100,NULL,121,50);
INSERT INTO employees VALUES (186,'Julia','Dellinger','JDELLING','650.509.3876',STR_TO_DATE('24-JUN-1998', '%d-%M-%Y'),'SH_CLERK',3400,NULL,121,50);
INSERT INTO employees VALUES (187,'Anthony','Cabrio','ACABRIO','650.509.4876',STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),'SH_CLERK',3000,NULL,121,50);
INSERT INTO employees VALUES (188,'Kelly','Chung','KCHUNG','650.505.1876',STR_TO_DATE('14-JUN-1997', '%d-%M-%Y'),'SH_CLERK',3800,NULL,122,50);
INSERT INTO employees VALUES (189,'Jennifer','Dilly','JDILLY','650.505.2876',STR_TO_DATE('13-AUG-1997', '%d-%M-%Y'),'SH_CLERK',3600,NULL,122,50);
INSERT INTO employees VALUES (190,'Timothy','Gates','TGATES','650.505.3876',STR_TO_DATE('11-JUL-1998', '%d-%M-%Y'),'SH_CLERK',2900,NULL,122,50);
INSERT INTO employees VALUES (191,'Randall','Perkins','RPERKINS','650.505.4876',STR_TO_DATE('19-DEC-1999', '%d-%M-%Y'),'SH_CLERK',2500,NULL,122,50);
INSERT INTO employees VALUES (192,'Sarah','Bell','SBELL','650.501.1876',STR_TO_DATE('04-FEB-1996', '%d-%M-%Y'),'SH_CLERK',4000,NULL,123,50);
INSERT INTO employees VALUES (193,'Britney','Everett','BEVERETT','650.501.2876',STR_TO_DATE('03-MAR-1997', '%d-%M-%Y'),'SH_CLERK',3900,NULL,123,50);
INSERT INTO employees VALUES (194,'Samuel','McCain','SMCCAIN','650.501.3876',STR_TO_DATE('01-JUL-1998', '%d-%M-%Y'),'SH_CLERK',3200,NULL,123,50);
INSERT INTO employees VALUES (195,'Vance','Jones','VJONES','650.501.4876',STR_TO_DATE('17-MAR-1999', '%d-%M-%Y'),'SH_CLERK',2800,NULL,123,50);
INSERT INTO employees VALUES (196,'Alana','Walsh','AWALSH','650.507.9811',STR_TO_DATE('24-APR-1998', '%d-%M-%Y'),'SH_CLERK',3100,NULL,124,50);
INSERT INTO employees VALUES (197,'Kevin','Feeney','KFEENEY','650.507.9822',STR_TO_DATE('23-MAY-1998', '%d-%M-%Y'),'SH_CLERK',3000,NULL,124,50);
INSERT INTO employees VALUES (198,'Donald','OConnell','DOCONNEL','650.507.9833',STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),'SH_CLERK',2600,NULL,124,50);
INSERT INTO employees VALUES (199,'Douglas','Grant','DGRANT','650.507.9844',STR_TO_DATE('13-JAN-2000', '%d-%M-%Y'),'SH_CLERK',2600,NULL,124,50);
INSERT INTO employees VALUES (200,'Jennifer','Whalen','JWHALEN','515.123.4444',STR_TO_DATE('17-SEP-1987', '%d-%M-%Y'),'AD_ASST',4400,NULL,101,10);
INSERT INTO employees VALUES (201,'Michael','Hartstein','MHARTSTE','515.123.5555',STR_TO_DATE('17-FEB-1996', '%d-%M-%Y'),'MK_MAN',13000,NULL,100,20);
INSERT INTO employees VALUES (202,'Pat','Fay','PFAY','603.123.6666',STR_TO_DATE('17-AUG-1997', '%d-%M-%Y'),'MK_REP',6000,NULL,201,20);
INSERT INTO employees VALUES(203,'Susan','Mavris','SMAVRIS','515.123.7777',STR_TO_DATE('07-JUN-1994','%d-%M-%Y'),'HR_REP',6500,NULL,101,40);
INSERT INTO employees VALUES (204,'Hermann','Baer','HBAER','515.123.8888',STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),'PR_REP',10000,NULL,101,70);
INSERT INTO employees VALUES (205,'Shelley','Higgins','SHIGGINS','515.123.8080',STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),'AC_MGR',12000,NULL,101,110);
INSERT INTO employees VALUES (206,'William','Gietz','WGIETZ','51hr5.123.8181',STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),'AC_ACCOUNT',8300,NULL,205,110);

COMMIT;

INSERT INTO job_history VALUES (102,STR_TO_DATE('13-Jan-1993', '%d-%M-%Y'),STR_TO_DATE('24-Jul-1998', '%d-%M-%Y'),'IT_PROG',60);
INSERT INTO job_history VALUES (101,STR_TO_DATE('21-Sep-1989', '%d-%M-%Y'),STR_TO_DATE('27-Oct-1993', '%d-%M-%Y'),'AC_ACCOUNT',110);
INSERT INTO job_history VALUES (101,STR_TO_DATE('28-Oct-1993','%d-%M-%Y'),STR_TO_DATE('15-Mar-1997','%d-%M-%Y'),'AC_MGR',110);
INSERT INTO job_history VALUES (201,STR_TO_DATE('27-Feb-1996','%d-%M-%Y'),STR_TO_DATE('19-Dec-1999','%d-%M-%Y'),'MK_REP',20);
INSERT INTO job_history VALUES (114,STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),'ST_CLERK',50);
INSERT INTO job_history VALUES (122,STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),'ST_CLERK',50);
INSERT INTO job_history VALUES (200,STR_TO_DATE('17-Sep-1987','%d-%M-%Y'),STR_TO_DATE('17-Jun-1993','%d-%M-%Y'),'AD_ASST',90);
INSERT INTO job_history VALUES (176,STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),'SA_REP',80);
INSERT INTO job_history VALUES (176,STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),'SA_MAN',80);
INSERT INTO job_history VALUES (200,STR_TO_DATE('01-Jul-1994','%d-%M-%Y'),STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),'AC_ACCOUNT',90);
    
COMMIT;

ALTER TABLE countries ADD FOREIGN KEY (region_id) REFERENCES regions(region_id);    
ALTER TABLE locations ADD FOREIGN KEY (country_id) REFERENCES countries(country_id);
ALTER TABLE departments ADD FOREIGN KEY (location_id) REFERENCES locations(location_id);
ALTER TABLE employees ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
ALTER TABLE employees ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
ALTER TABLE departments ADD FOREIGN KEY (manager_id) REFERENCES employees (employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (employee_id) REFERENCES employees(employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE job_history ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
*/
/*1.write a SQL query to find customers who are either from the city 'NewYork' or
who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id.
select 
	customer_id,
    cust_name,
    city,
    grade,
    salesman_id
from customer
where city = 'New York' or grade > 100 or grade IS NULL;*/
/*2.write a SQL query to find all the customers in ‘New York’ city who have agradevalue above 100. Return customer_id, cust_name, city, grade, and salesman_id. 
select *
from customer
where city = 'New York' and grade > 100;
*/
/*3.Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50%of thetarget value of 6000.
select 
	ord_no,
    purch_amt,
    (purch_amt/6000) * 100 AS achieved,
    ((purch_amt/6000) * 100)-100 AS unachieved
from orders
where purch_amt >= 3000;
*/    

/*4.write a SQL query to calculate the total purchase amount of all orders. Return total purchase amount. 
select 
	sum(purch_amt) AS Total_Amount
from orders;
*/
/*5. write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount.
select 
	customer_id,
	max(purch_amt) as Maximum_amt
from orders
group by customer_id;*/
/*6. write a SQL query to calculate the average product price. Return average product price.
select
	avg(pro_price) AS Avg_product
from item_mast;
*/
/*7. write a SQL query to find those employees whose department is located at ‘Toronto’. Return first name, last name, employee ID, job ID.
select
	employees.first_name,
	employees.last_name,
	employees.employee_id,
    employees.job_id,
    employees.department_id,
    locations.city
from employees
LEFT JOIN departments ON  employees.department_id = departments.department_id
LEFT JOIN locations ON departments.location_id = locations.location_id
where locations.city = 'Toronto';
*/
/*8.write a SQL query to find those employees whose salary is lower than that of employees whose job title is "MK_MAN". Exclude employees of the Jobtitle‘MK_MAN’. Return employee ID, first name, last name, job ID.
select
	employees.employee_id,
	employees.last_name,
    employees.first_name,
    employees.job_id
     employees.salary
from employees
JOIN jobs ON employees.job_id = jobs.job_id
where jobs.job_id = 'MK_MAN'
order by employees.salary;
*/
/* 9. write a SQL query to find all those employees who work in department ID80or40. Return first name, last name, department number and department name.
select
	employees.last_name,
    employees.first_name,
    employees.department_id,
    departments.department_name
from employees
JOIN departments ON employees.department_id = departments.department_id
where departments.department_id IN (80,40); 
*/
/*10.write a SQL query to calculate the average salary, the number of employees receiving commissions in that department. Return department name, averagesalary and number of employees. 
select
	avg(employees.salary) AS Avg_Salary,
    count(employees.employee_id),
    departments.department_name
from employees
JOIN departments ON employees.department_id = departments.department_id
group by departments.department_name;
*/
/*11.write a SQL query to find out which employees have the same designationas theemployee whose ID is 169. Return first name, last name, department IDandjobID.
select 
	last_name,
    first_name,
    department_id,
    job_id,
    employee_id
from employees
where job_id = (select job_id from employees where employee_id = 169);*/
/* 12.write a SQL query to find those employees who earn more than the averagesalary. Return employee ID, first name, last name.
select 
	employee_id,
    first_name,
    last_name,
    salary
from employees
where salary > (select avg(salary) from employees);*/
/*13.write a SQL query to find all those employees who work in the Finance department. Return department ID, name (first), job ID and department name.
select 
    employees.department_id,
	employees.first_name,
    employees.job_id,
    departments.department_name
from employees
JOIN departments ON employees.department_id = departments.department_id
where departments.department_name = 'Finance';*/
/*14. From the following table, write a SQL query to find the employees who earn less than the employee of ID 182. Return first name, last name and salary.
select
	last_name,
    first_name,
    salary
from employees
where salary < (select salary from employees where employee_id = 182);*/
/* 15.Create a stored procedure CountEmployeesByDept that returns the number of employees in each department
Delimiter $$
create procedure CountEmployeesByDept()
	begin
		select 
			department_id,
            count(*) AS employees_count
		from employees
        GROUP BY department_id;
	end $$
Delimiter ;
call CountEmployeesByDept();*/
/*16.Create a stored procedure AddNewEmployee that adds a new employee tothedatabase.
delimiter //
create procedure ins_values(IN eid INT,IN fn VARCHAR(20),IN ln VARCHAR(25),IN email VARCHAR(25),IN pno VARCHAR(20),IN hdate DATE,
IN jid VARCHAR(10), IN s DECIMAL(8, 2),IN com DECIMAL(2, 2),IN mid INT,IN did INT)
begin
	insert into employees values(eid,fn,ln,email,pno,hdate,jid,s,com,mid,did);
end //
delimiter ;	
call ins_values(207,'Himali','Shah','HIMALI','123,456,7890','2011-03-03','AC_ACCOUNT',45000,NULL,148,40);
select * from employees;*/
/* 17.Create a stored procedure DeleteEmployeesByDept that removes all employees employeesfrom a specific department.
drop procedure del_emp;
select * from departments;
select * from employees;
delimiter //
	create procedure del_emp(IN did INT)
	begin
		delete from employees
        JOIN departments ON  employees.department_id = departments.department_id
		where employees.department_id = did;
	end //
delimiter ;
call del_emp(40);
*/
/* 18.Create a stored procedure GetTopPaidEmployees that retrieves the highest-paidemployee in each department.
Delimiter //
create procedure max_salary()
begin
	select 
		employees.employee_id,
        employees.first_name,
		employees.last_name,
		employees.salary,
		departments.department_id
	from departments
	RIGHT JOIN employees ON employees.department_id = departments.department_id
	where employees.salary = (select max(employees.salary) AS max_Salary from employees);
end //
Delimiter ;
call max_salary();*/
/*19.Create a stored procedure PromoteEmployee that increases an employee’s salaryand changes their job role.*/
/*Drop procedure PromoteEmployee;
DELIMITER $$
CREATE PROCEDURE PromoteEmployee (
    IN empId INT,
    IN newSalary DECIMAL(10, 2),
    IN newJobId VARCHAR(10)
)
BEGIN
    -- Optional: Check if newSalary is within the new job's salary range
    DECLARE minSal DECIMAL(10, 2);
    DECLARE maxSal DECIMAL(10, 2);
    
    SELECT min_salary, max_salary 
    INTO minSal, maxSal 
    FROM jobs 
    WHERE job_id = newJobId;

    IF newSalary < minSal OR newSalary > maxSal THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'New salary is not within the range for the new job role.';
    ELSE
        UPDATE employees
        SET salary = newSalary,
            job_id = newJobId
        WHERE employee_id = empId;
    END IF;
END $$
DELIMITER ;
CALL PromoteEmployee(100, 16000, 'AC_MGR');
select * from employees;*/
/* 20.Create a stored procedure AssignManagerToDepartment that assigns a newmanager to all employees in a specific department.
Delimiter //
create procedure AssignManagerToDepartment(IN x INT,IN y INT)
begin
	 update employees set 
     manager_id = y
     where department_id = x ;
end //
Delimiter ;
call AssignManagerToDepartment(10,104);
select * from employees;*/