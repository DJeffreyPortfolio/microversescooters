if Rails.env.production?
	Rails.configuration.stripe = {
		publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
		secret_key: ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
		publishable_key: 'pk_test_pzrwQdKGobXLIq6S3qimyq7j',
		secret_key: 'sk_test_WAILQDBab6HqpPCn8v8GNSK4'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]