Stripe.api_key = ENV['STRIPE_SECRET_KEY']
Stripe.ca_bundle_path = File.join(Rails.root, '/cert.pem')
