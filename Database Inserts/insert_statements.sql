drop database if exists nypd;

create database nypd;

use nypd;

set global local_infile = ON;

create table gen(
gen_crime_code int primary key,
gen_crime_desc varchar(250) not null);

create table temp_gen (
    temp_gen_crime_code int,
    temp_gen_crime_desc varchar(250)
);

create table detailed(
specific_crime_code int primary key,
specific_crime_desc varchar(250) not null);

create table temp_detailed (
    temp_specific_crime_code int,
    temp_specific_crime_desc varchar(250)
);

create table offense_level(
level_of_offense varchar(1) primary key,
level_of_offense_desc varchar(25) not null);

create table borough(
boro varchar(1) primary key,
boro_name varchar(30) not null);

create table jurisdiction(
jurisdiction_id int primary key,
jurisdiction_name varchar(25) not null);

drop table if exists arrests;
create table arrests(
arrest_id int primary key,
arrest_date date not null,
gen_crime_code int,
constraint gen_fk foreign key (gen_crime_code) references gen (gen_crime_code),
specific_crime_code int,
constraint specific_fk foreign key (specific_crime_code) references detailed (specific_crime_code),
level_of_offense varchar(1),
constraint level_fk foreign key (level_of_offense) references offense_level (level_of_offense),
boro varchar(1),
constraint boro_fk foreign key (boro) references borough (boro),
jurisdiction_id int,
constraint jurisdiction_fk foreign key (jurisdiction_id) references jurisdiction (jurisdiction_id),
arrest_precinct int not null,
age_group varchar(50) not null,
perp_sex varchar(50) not null,
perp_race varchar(50) not null);

load data local infile 'C:\\Users\\dku19\\Downloads\\CS 3200\\Project\\nypd_gen_crime_data.csv'
into table temp_gen
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\n'
ignore 1 lines;


insert into gen (gen_crime_code, gen_crime_desc)
select distinct temp_gen_crime_code, temp_gen_crime_desc
from temp_gen;

drop table temp_gen;


load data local infile 'C:\\Users\\dku19\\Downloads\\CS 3200\\Project\\nypd_specific_crime_data_1.txt' into table temp_detailed;

-- We have a primary key that represent two different things!! 
-- Since both descriptions are very similar, we'll get rid of WEAPONS POSSESSION 1 & 2 since it only has 3 entries 
update temp_detailed
set temp_specific_crime_desc = 'CRIMINAL POSSESSION WEAPON'
where temp_specific_crime_code = 792;

insert into detailed (specific_crime_code, specific_crime_desc)
select distinct temp_specific_crime_code, temp_specific_crime_desc
from temp_detailed;


insert into offense_level (level_of_offense, level_of_offense_desc) values
('F', 'Felony'),
('M', 'Misdemeanor'),
('V', 'Violation');

insert into borough (boro, boro_name) values
('K', 'Brooklyn'),
('Q', 'Queens'),
('B', 'Bronx'),
('S', 'Staten Island'),
('M', 'Manhattan');

load data local infile 'C:\\Users\\dku19\\Downloads\\CS 3200\\Project\\nypd_jurisdiction.txt' into table jurisdiction;


update jurisdiction
set jurisdiction_name = 'Patrol'
where jurisdiction_id = 0;

update jurisdiction
set jurisdiction_name = 'Transit'
where jurisdiction_id = 1;

update jurisdiction
set jurisdiction_name = 'Housing'
where jurisdiction_id = 2;

update jurisdiction
set jurisdiction_name = 'Non-NYPD'
where jurisdiction_id > 2;

load data local infile 'C:\\Users\\dku19\\Downloads\\CS 3200\\Project\\nypd_arrest_data (1).txt' into table arrests;