# NYPD Arrest Research through Database Implementation

## Introduction
As a born and raised Brooklynite, safety of all New Yorkers has always been an area of concern for my entire life. With what seems like never-ending stories about innocent lives lost everyday on the news, it feels like it's now part of our daily routine. It's become so second nature for New Yorkers to expect to hear of a crime happening in the city we love so much, but there doesn't seem to be a way where an average New Yorker like me can track all of them that have happened. 

What if there was a centralized and reliable way to accurately track each arrest through a database? I pitched this project idea to my classmates in CS 3200: Introduction to Databases, and we worked together to make this database come to life, discovering valuable insights from the first nine months of 2024. In this project, I was solely responsible for the entire database design process, while overseeing and giving feedback to the queries created by my classmates. At the time of project completion, this database focuses on NYPD arrest data from Janunary 1st, 2024 to September 30th, 2024. The original dataset can be found here: https://data.cityofnewyork.us/Public-Safety/NYPD-Arrest-Data-Year-to-Date-/uip8-fykc/about_data. 

## Database Design
In this dataset, we are given a plethora of information that highlights every detail of an arrest. In each arrest, we are given the:
- An Arrest ID (Unique for each arrest)
- Arrest Date
- General Crime Code
- General Crime Description
- Specific Crime Code (more in depth than general)
- Specific Crime Description
- Level of Offense (Misdemeanor, Felony, or Violation)
- Borough (of the arrest)
- Jurisdiction responsible for the arrest (Patrol, Transit, Housing, or Non-NYPD)
- Precinct (that made the arrest)
- Perpetrator Age Range
- Perpetrator Sex
- Perpetrator Race

Due to the great wealth of information from this dataset, I decided to seperate all categories except for arrest id, arrest date, and perpetrator information into its own tables. Below is the ER Diagram of this database: 


