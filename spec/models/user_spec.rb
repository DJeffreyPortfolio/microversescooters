require 'rails_helper'

describe User do

	context "testing validation" do

		it "should not validate users without email address" do
			expect(User.new(email: nil)).not_to be_valid
		end
	end

end