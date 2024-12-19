use nypd;

-- Number of arrests in each borough
select 
	boro_name,
    count(arrest_id) as 'num_arrests'
from arrests
join borough using (boro)
group by boro
order by num_arrests desc;

-- Which Precinct made the most arrests?
select
	arrest_precinct,
    boro_name,
    count(arrest_id) as 'num_arrests'
from arrests
join borough using (boro)
group by arrest_precinct, boro
order by num_arrests desc
limit 15;

-- top crimes by borough
select
    b.boro_name, 
    d.specific_crime_desc, 
    count(*) as arrest_count,
    round(count(*) / (select count(*) from arrests) * 100, 2) as percentage
from arrests a
join borough b on a.boro = b.boro
join detailed d on a.specific_crime_code = d.specific_crime_code
group by b.boro_name, d.specific_crime_desc
order by arrest_count desc
limit 15;

-- crime by demographics
select 
    age_group, 
    perp_race, 
    perp_sex, 
    o.level_of_offense_desc,
    count(*) as total_arrests,
    round(count(*) / (select count(*) from arrests) * 100, 2) as percentage
from arrests a
join offense_level o on a.level_of_offense = o.level_of_offense
group by age_group, perp_race, perp_sex, o.level_of_offense_desc
order by total_arrests desc
limit 20;

-- crime code frequency
select 
    g.gen_crime_code,
    g.gen_crime_desc,
    count(*) as occurrence_count,
    round(count(*) / (select count(*) from arrests) * 100, 2) as percentage
from arrests a
join gen g on a.gen_crime_code = g.gen_crime_code
group by g.gen_crime_code, g.gen_crime_desc
order by occurrence_count desc
limit 15;

-- monthly level of offense trends
select
	month(arrest_date) as arrest_month,
    monthname(arrest_date) as arrest_month_name,
    o.level_of_offense_desc,
    count(*) as monthly_arrests,
    (round(count(*) * 100.0 / sum(count(*)) over (partition by month(arrest_date)), 2)) as percent_by_month
from arrests a
join offense_level o on a.level_of_offense = o.level_of_offense
group by arrest_month, arrest_month_name, o.level_of_offense_desc
order by arrest_month, monthly_arrests desc;