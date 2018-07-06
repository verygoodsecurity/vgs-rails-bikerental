BikeRental
============

Example Secure Implementation of [VGS](https://www.verygoodsecurity.com) in Ruby on Rails.


Clone
--------

    $ git clone (will update once repo is open)


Configure
----------

Create an .env file for the app by renaming .env.sample to .env

* Check out .env.sample to see what environment variables you should have (just add https_proxy for VGS and a Stripe API key sandbox if you want to see it work all the way through)(https://dashboard.verygoodsecurity.com) if you don't have one.


Functionality displayed
-----------------------

1. Redacting via secureform post in ERB (currently need to expose to internet so ngrok as upstream will work, you will also need to swap out the src of the secure form to your own (and instantiate yours so it goes to your vault)
2. Revealing CC info to the authenticated user. After a payment method is added there is a vew in session, to check Payment Method. This will retrieve payment details. These will still be redacted until a filter is set up to "reveal" on "GET" in the VGS dashboard.
3. Lastly as part of the payment submission the stripe gem goes through the VGS Proxy via environment configurations - this is show in .env.sample. If both of those are filled out this will run smoothly create a record "fake charge a card in stripes API sandbox" and show you how it will work on your apps. (You will also need to configure reveal rules on the outbound connection to stripe)

Run / Install
----

    $ docker-compose up --build

