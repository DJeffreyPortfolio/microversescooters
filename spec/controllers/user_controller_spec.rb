require 'rails_helper'

describe UsersController, type: :controller do
	
	let(:user1) {User.create!(email: 'test@testing.com', password: 'testingtesting')}
	let(:user2) {User.create!(email: 'test2@testing.com', password: 'testingtesting')}


	describe 'GET #show' do
		context 'when a user is logged in' do
			before do
				sign_in user1
			end
		end

		context 'when a user is not logged in' do
			it 'redirects to login' do
				get :show, params: {id: user1.id}
				expect(response).to redirect_to(new_user_session_path)
			end
		end

		context 'user trying to view another profile' do
			get :show, params: {id: user2.id}
			it 'redirects to root url and throws execption' do
				expect(response).to redirect_to (root_path)
				expect(response).to have_http_status(302)
			end
		end
	end
end