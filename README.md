# Parks Lookup

##### By Bably Kumari

## Description

This API lets users do CRUD and search for parks.

## Setup

*  git clone https://github.com/bablyseattle/Parks-Lookup

*  $ bundle install

*  $rake db:setup

* $rails s



## Request Routes

* GET /parks - all parks are displayed

* GET /parks/:id - request a park by id

* POST /parks - create parks with parameters name and state

* PUT /parks/:id - update parks with one or both parameters name and state

* DELETE /parks/:id - delete the park from the database

* GET /parks?name[""] - search for a park in database based on name

## Known Bugs

* No Known Bugs

## Technology Used

* Rails

* Postgres

* Many gems like faker, factory bot for test etc.


## Contact Info

For questions and comments, please contact bablyhyd@gmail.com

## License

Copyright (c) 2017

This software is licensed under the MIT licensed