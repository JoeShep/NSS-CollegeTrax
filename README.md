NSS-CollegeTrax
=====================


Purpose
-------

This is project for the Unit 2 (Ruby) portion of the Nashville Software School Software Development Fundamentals course.

The contstraints of the project are that it must use standard library Ruby with the exception of being able to use <a href="http://en.wikipedia.org/wiki/ActiveRecord_%28Rails%29#Ruby">ActiveRecord as an ORM</a>.  Future exceptions may be added, but the concept with this capstone is to demonstrate mastery of Ruby itself.

The goal of this project is to create a visit log and ranking system for high school students who are visiting colleges and universities as part of the application process.

Many students visit multiple schools, sometimes over a very short period of time, sometimes with long stretches between visits. Both scenarios can make it hard to remember what a student liked or disliked about a particular school. This app will help the user keep track of each visit and allow the user to see how the schools compare to each other in the areas of greatest importance, as weighted by the user.

Project Status / TODO
---------------------
May 22:
This project is in initial TDD stages.
Current functionality:
Takes three arguments (School name, visit date, single ranking number)
Prints all schools, with visit date and ranking in order of entry
Prints schools with user ranking, from highest to lowest rank.
Deletes any record by school name.

Features
--------
The main features of CollegeTrax will be:

**1) Inputs for:<br>**
  School name<br>
  Visit date<br>
  Yes/no for school in session when visited?<br>
  Names/contact info for anyone you spoke to<br>
  Visit activities (tour, interview, info session, overnight, classroom visit, meals)

**2) Prompts/questions about campus/academics/student life<br>**
    Examples:<br>
    How do students get to class?<br>
    What are school activities/traditions you heard about?

**3) Additional Notes section**

**4) Rating system (1 - 5 and NA) for:<br>**
Dorms<br>
Campus appearance<br>
Food choices
  (gf, dining service/off campus)<br>
Majors of interest<br>
College town<br>
Library<br>
Student friendliness<br>
Facilities (classrooms/labs/student center)<br>
**Categories will be weighted by user-customized importance kinda/very/uber**

**A generated report with the following:**<br>
General info entered by user<br>
Star ratings of each category<br>
Ranking of schools once more than one school is entered

------------------

**Methods, etc needed:**
intro/instructions
store rating
capture user input of text
display comments section
category weight
display visit data input areas

Usage Instructions
------------------
Planned usage is as follows:

To add a new school to the database:

    > ./collegetrax.rb add "<school name>"

To view the list of all entered schools:

    > ./collegetrax.rb list_schools

To view a school:

    > ./collegetrax.rb view school "<school name>"

To remove a school:

    > ./collegetrax.rb remove "<school name>"

To view the list of all entered schools by highest average ranking:

    > ./collegetrax.rb list_rankings

*Other instructions to come*

Demo
----

To demo the app, you'll have to download it and try it yourself.

Known Bugs
----------
None, yet! But just wait.

Author
------

Joe Shepherd

Changelog
---------

5/9/2013 - Created initial repository with README and user stories.

License
-------
Copyright (c) 2013 Joe Shepherd

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.