# Simprest
=======================

Simple REST app using Rails 4.0.2


## Requirements

* Ruby 1.9
* Any RDBMS (Postgres in our case)
 
## Setup


Create `database.yml` from `config/database.yml.example` and make changes according your preferences.

Run `bundle install` to install dependencies.

Setup your database by running `rake db:create && rake db:migrate`

If you want to load test data run `rake db:seed`

Start server `rails s`

## TODO:

* write specs
* add caching