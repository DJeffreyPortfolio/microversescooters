require 'rails_helper'

describe Product, type: :model do

	context "when the product has comments" do

		before do
			@product = FactoryBot.create(:product)
			@user = FactoryBot.create(:user)
			
			@comments1 = @product.comments.create(rating: 1, user: @user, body: "Terrible Scooter")
			@comments2 = @product.comments.create(rating: 3, user: @user, body: "Not bad!")
			@comments3 = @product.comments.create(rating: 5, user: @user, body: "Amazing Scooter!!!")
		end
		
		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end

		it "is not valid without a name" do
			expect(Product.new(description: "Testing Awesomeness")).not_to be_valid
		end
	end

end