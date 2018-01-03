class PaymentsController < ApplicationController
	
	def create
		token = params[:stripeToken]
		# Create the charge on Stripe's Servers. This will charge the user's card.

		@product = Product.find(params[:product_id])
		@user = current_user

		begin
			
			charge = Stripe::Charge.create(
				amount: (@product.price*100).to_i, #Amount in cents
				currency: "usd",
				source: token,
				description: params[:stripeEmail]
				)

			if charge.paid
				Order.create(
					product_id: @product.id,
					user_id: @user.id,
					total: @product.price
					)
				flash[:success] = "Your payment was processed successfully"
				UserMailer.order_placed(@user, @product).deliver_now
			end

		rescue Stripe::CardError => e
			#Card has been declined.
			body = e.json_body
			err = body[:error]
			flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
		end
		redirect_to product_path(product)
end
