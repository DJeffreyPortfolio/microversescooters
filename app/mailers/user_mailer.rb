class UserMailer < ApplicationMailer
	default from "D_Jeffrey87@yahoo.com"

	def contact_form(email, name, message)
		@message = message
		mail(from: email,
			to: "D_Jeffrey87@yahoo.com",
			subject: "A new contact form message from #{name}")
	end
end
