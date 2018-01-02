require 'rails_helper'

describe UsersController, type: :controller do
	
	@user1 = FactoryBot.build(:user)
	@user2 = FactoryBot.build(:user)


	describe 'GET #show' do
		context 'when a user is logged in' do
			before do
				sign_in @user1
			end
		end
	end
end