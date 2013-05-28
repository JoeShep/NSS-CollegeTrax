User Stories for CollegeTrax
==============================

<hr />

As a prospective college student<br />
In order to make sure I have a record of all the schools I visit<br />
I want to store names of colleges.

  - User runs `./trax`
  - User is given a list of options, one of which is "To add a new school, type './trax add <school name>' "
  - User runs `./trax add <school name>'`
  - The user sees "Success! Would you like to enter details about your trip?"

<hr />

As a prospective college student<br />
In order to recall important information about the schools I visit<br />
I want to add details about the school and my impressions about the things that are important to me.

  - User runs `./trax rank <school name>`
  - Categories are presented one by one after each ranking is entered (by user typing 0 - 5 or NA)

<hr />

As a prospective college student<br />
In order to keep a list of schools I have visited<br />
I want to print a list of schools.

  - User runs `./trax list` to see the list of schools, alphabetically

<hr />

As a prospective college student<br />
In order to compare a list of schools I have visited<br />
I want to print a list of schools, in order of my rankings.

- User runs `./trax list ranking` to see the list of schools, ordered by highest to lowest ranking.

<hr />

As a prospective college student<br />
In order to remember my thoughts about a school<br />
I want to see all the information I entered

  - User runs `./trax view "SchoolName"` "<school name>" to bring up a full record of the entered text and ranking of each category.

<hr />

As a prospective college student<br />
In order to keep my schools list current<br />
I want to be able to delete a school from the list

  - User runs `./trax remove "<school name>"` to remove a school and all of its infro from the database. A safety prompt will ask the user to confirm.
