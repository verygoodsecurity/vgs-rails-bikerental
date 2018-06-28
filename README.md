BikeRental
============

[![Code Climate](https://codeclimate.com/github/balanced/BikeRentals-rails.png)](https://codeclimate.com/github/balanced/BikeRentals-rails)

Example marketplace implementation of [Balanced](https://www.balancedpayments.com) in Ruby on Rails.

Uses jQuery, [Less](http://lesscss.org/), Ruby(>=1.9.3), Rails (>= 4.0.0.rc1), [Devise](https://github.com/plataformatec/devise), PostgreSQL, and
[Bootstrap](http://twitter.github.com/bootstrap/).

If you'd like to deploy this application. signup for a [Heroku account](http://www.heroku.com/signup), if you don't already have one, and install [Toolbelt](https://toolbelt.heroku.com/).


Live Demo
----------

[http://BikeRental-rails.herokuapp.com](http://BikeRental-rails.herokuapp.com)


Resources
----------

* [Balanced Ruby Client](https://github.com/balanced/balanced-ruby)
* [Balanced API docs](https://docs.balancedpayments.com/1.1/api/?language=ruby)
* [Balanced Guides](https://docs.balancedpayments.com/1.1/guides/?language=ruby)
* [balanced.js](https://docs.balancedpayments.com/1.1/guides/balanced-js/?language=ruby)


Install
--------

    $ git clone https://github.com/balanced/BikeRentals-rails.git
    $ cd BikeRentals
    $ bundle install
    $ rake db:create
    $ rake db:migrate
    $ foreman run rake db:seed (if you want to seed database - also requires foreman gem)


Configure
----------

Create an .env file for the app by renaming .env.sample to .env

* Set `BALANCED_SECRET` to your secret key. Get one from [Balanced] (https://dashboard.balancedpayments.com/#/start) if you don't have one.

Edit `BikeRental/config/initializers/devise.rb`:

* Configure the e-mail address which will be shown in Devise::Mailer

Edit `BikeRental/config/database.yml`:

* Set all necessary fields for your database.

Example:

```
common: &common
adapter: postgresql
username:
password:
host: localhost
timeout: 5000
```

```
development:
<<: *common
database: BikeRental_dev
```

```test:
<<: *common
database: BikeRental_test
```



Run
----

    $ foreman start

or if you dont have [Toolbelt] (https://toolbelt.heroku.com/)

    $ rails s


Deploy
-------

    $ cd BikeRentals
    $ heroku create
    $ git push origin heroku
    $ heroku ps:scale web=1
    $ heroku open
