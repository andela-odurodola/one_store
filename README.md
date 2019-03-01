# README
[![Build Status](https://travis-ci.org/andela-odurodola/one_store.svg?branch=server)](https://travis-ci.org/andela-odurodola/one_store) [![Test Coverage](https://api.codeclimate.com/v1/badges/9095681b005dff4d4d65/test_coverage)](https://codeclimate.com/github/andela-odurodola/one_store/test_coverage)

[One Store](https://one-store-prod.herokuapp.com) is a library management API. User can view the book catalogue, rent books and give their reviews. It is developed with Rails with Postgres as the database. Only the admin can make update to the catalogue and approve/reject rent request. The API is to be consumed by any frontend framework for use.



* Features
  * Book Catalogue.
  * Rent Book(s).
  * Favourite Book(s).
  * Review Book(s).

How to run the app.

* Clone the app

* Create and Setup the database
  * `rails db:setup`

* Run Migrations
  * `rails db:migrate`

* Seed the Database
  * `rails db:seed`

