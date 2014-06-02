peacecorps-hack
===============

Peace Corps opportunity explorer (proof-of-concept hack)

This project was a quick proof-of-concept for a Peace Corps challenge on NDoCH 2014:
http://hackforchange.org/challenges/peace-corps-opportunities-interface/(]


Getting Started
===============

You'll need the compass ruby gem, nodejs, and grunt installed. Then in theory this will get you up-and-running for development:

    bower install    
    grunt serve
    
    
Problem Statement
=================

Create a fun, engaging and easy-to-use interface with the numerous and diverse Peace Corps volunteer opportunities that helps the user find the right opportunity for them.

Challenge
---------

Currently, Peace Corps asks an applicant to apply a general pool and then a centralized placement team at Peace Corps headquarters matches the applicant’s skills, medical needs and preferences with an available opportunity. This system has been successful but creates a bottleneck in moving applicants through the process causing many great applicants to drop out of the process. In hopes of speeding up the process, Peace Corps is transitioning to a placement system that is completely transparent to the applicant giving them the opportunity to browse through the 4,000+ volunteer opportunities and apply for the one that fits them best. Essentially, allowing applicants to place themselves.

Background
----------

We are providing all of the data we have about the upcoming opportunities over the next year and looking for proposals for how we can present this data on our website allowing for the potential applicant to:

* Quickly get a sense of breadth of countries, jobs and departure dates.
* Efficiently navigate through the data to find the best fit for them.
* Take action on an exciting opportunity, including:
  * Start their application (through clicking on a link to our online application)
  * Share the opportunity with a friend
  * Request contact from a recruiter

Technical Considerations
------------------------

Our web team works in Python, Django. All else being equal, it would be easiest to incorporate an application written in this framework.
The data source for the application will eventually be a hosted machine readable file hosted on an FTP server.

Email the project lead for the JSR (available opportunities) and the Medical support by country (medical needs for each country).
