# NYPD Arrest Research through Database Implementation

## Introduction
As a born and raised Brooklynite, safety of all New Yorkers has always been an area of concern for my entire life. With what seems like never-ending stories about innocent lives lost everyday on the news, it feels like it's now part of our daily routine. It's become so second nature for New Yorkers to expect to hear of a crime happening in the city we love so much, but there doesn't seem to be a way where an average New Yorker like me can track all of them that have happened. 

What if there was a centralized and reliable way to accurately track each arrest through a database? I pitched this project idea to my classmates in my databases class, and we worked together to make this database come to life, discovering valuable insights from the first nine months of 2024. In this project, I was solely responsible for the entire database design process, while overseeing and giving feedback to the queries created by my classmates. At the time of project completion, this database focuses on NYPD arrest data from January 1st, 2024 to September 30th, 2024. The original dataset can be found here: https://data.cityofnewyork.us/Public-Safety/NYPD-Arrest-Data-Year-to-Date-/uip8-fykc/about_data. Code for database implementation and queries can be found in the folders of this repository.

## Database Design
In this dataset, we are given a plethora of information that highlights every detail of an arrest. In each arrest, we are given the:
- Arrest ID (Unique for each arrest)
- Arrest Date
- General Crime Code and Description
- Specific Crime Code and Description (more in depth than general)
- Level of Offense (Misdemeanor, Felony, or Violation)
- Borough (where the arrest was made)
- Jurisdiction responsible for the arrest (Patrol, Transit, Housing, or Non-NYPD)
- Precinct (that made the arrest)
- Perpetrator Age Range, Sex, Race

Due to the great wealth of information from this dataset, I decided to seperate all categories except for arrest id, arrest date, and perpetrator information into its own tables. This is widely known as normalization; the database is in third normal form, as there are no transitive or partial dependencies. Below is the ER Diagram of this database: 

<img src="/assets/images/NYPD_DB_Design.png" alt='image' width='500' height='350'>

## Findings
Our queries are aimed to find demographic trends in arrests, which includes age group, borough, and level of offense.
Below are some of our findings. These visualizations were created by me using Python.

![Percentage Arrests](/assets/images/borough_arrest_percentage.png)

![Age Group Distribution](/assets/images/crime_age_group_distribution.png)

![Age Group Distribution with Borough](/assets/images/crime_age_group_with_borough.png)

![Level of Offense with Borough](/assets/images/level_of_offense_borough.png)

![Geopandas Viz](/assets/images/nypd_geo_viz.png)

## Conclusion and Future Work
Based on the visualizations, we noticed the following:
- Brooklyn has the most arrests in the city, coming in at 28%
- The young adult age group (25-44) make up most of the arrests in NYC, with most of them coming from Brooklyn
- Misdemeanors make up the most of the offenses, with the most coming from Brooklyn
- Top crimes in the city are coming from Midtown, South Bronx, and neighborhoods in East New York

It's pretty clear that more needs to be done in these neighborhoods to decrease crime, as these areas have long been known to have high crime rates. With this project, I hope that this project provides more awareness that change in both policy and social life is needed to protect the city of over eight million New Yorkers. Although there are many factors, examples of change include increasing policing in places like subway stations and streets at night, addressing the illegal possession of guns, and creating awareness of mental health resources that is available to every New Yorker.

Future work for this project includes examining the change in crime demographics over the last decade, as that can give us a better idea of what areas have been improved upon and which still need more work. It would also be interesting to see how the age group demographic has changed, if at all, as it would be natural to assume that younger age groups tend to commit more crimes than older groups. 

## Acknowledgements
Special thanks to my classmates in the databases class for making this project come to life: Natalie Kwong, Sini Luo, Jiaqiang (Arnold) Wang, and Victor Zheng
