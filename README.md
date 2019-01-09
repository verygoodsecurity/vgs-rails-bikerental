BikeRental
============

Example Secure Implementation of [VGS](https://www.verygoodsecurity.com) 
in Ruby on Rails using [VGS Collect](https://www.verygoodsecurity.com/docs/features/vgs-collect) library. 
Follow the instructions below to see how VGS Collect works. 

As part of the payment submission, the stripe gem goes through 
the VGS Proxy via environment configurations - this is shown in .env.sample.
If both of those are filled out this will run smoothly create a record 
"fake charge a card in stripes API sandbox" and show you how it will work on your apps.

Dependencies
------------
- Rails 4.1
- Ruby 2.3.7

Using RVM is easiest here to set Ruby Version.

Requirements
------------

- [VGS account](https://dashboard.verygoodsecurity.com)
- [ngrok](https://ngrok.com/)
- [Stripe account](https://stripe.com/)

Configuration
------------

### 1. Clone repository

    $ git clone [url]
    
### 2. VGS base setup

- Go to [VGS dashboard](https://dashboard.verygoodsecurity.com)
- Create a new organization and vault
- Select vault, go to `Integration` page
- Find proxy URL, it should be in format:

```
http://<user>:<password>@<tenant>.SANDBOX.verygoodproxy.com:8080
```

### 3. .env config

- Open BikeRental project repo
- Rename .env.sample to .env
- Open .env file
- Set https_proxy:
```
https_proxy=<The proxy URL you found in step 2>
```
- Set `STRIPE_SECRET_KEY`. Go to [Stripe dashboard](https://dashboard.stripe.com/dashboard) and get your secret key.

### 4. VGS Collect setup

- Generate VGS Collect file for created organization.
- Open `application.html.erb` file.
- Include your VGS Collect library file into the application.
- Open `main.js`. Change `environment` param to your [vault id](https://www.verygoodsecurity.com/docs/terminology/nomenclature#vault) inside initialization function:

```
const f = VGSCollect.create('<vault id>', function(state) {});
```

### 5. Run

```
$ docker-compose up --build
```

### 6. Run ngrok

```
ngrok http 3000
```

- Copy provided address:
```
https://<some_id>.ngrok.io
```

### 7. Secure inbound traffic with VGS

- Go to VGS dashboard
- Go to Secure traffic -> Inbound
- Put ngrok URL to upstream
- An application should be available by https://<tenant>.sandbox.verygoodproxy.com/
    
### 8. Secure outbound traffic with VGS

- Go to VGS dashboard
- Go to `Secure traffic` -> `Outbound`
- Click on `Secure this payload`

### 9. Submit VGS Collect form

- Open application
- Sign up
- Choose a bike
- Proceed to checkout. Checkout form initialized as a VGS Collect secure form
- Fill and submit a form
- Go to VGS Logs tab to ensure that logger is recording payloads
- Open Stripe logs (`Developers` tab -> `Logs`) to see your request


Useful links
------------

- [VGS Getting Started guide](https://www.verygoodsecurity.com/docs/getting-started)
- [VGS Collect documentation](https://www.verygoodsecurity.com/docs/features/vgs-collect)
- [VGS Collect use case examples](https://verygoodsecurity.github.io/vgs-collect-examples/)
- [VGS Collect code examples](https://github.com/verygoodsecurity/vgs-collect-examples/tree/master/examples)
