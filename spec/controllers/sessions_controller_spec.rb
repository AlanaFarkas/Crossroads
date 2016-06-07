# require 'rails_helper'

# describe Users::SessionsController do
#   include SessionsHelper
#   let!(:user) { User.new }
#   describe 'GET #login' do
#     it "initializes a blank user for logging in" do
#       get :new
#       expect(assigns(:user)).to be_an_instance_of(User)
#     end
#   end

#   describe "POST #login" do
#     context "when valid params are passed" do
#       it "creates a new session for a specific user" do
#         expect{ post :create, { user: { username:"username", password:"password"} } }.to change(current_user).from(nil).to(user)
#       end
#     end
#   end

#   describe "GET #logout" do
#     it "deletes a session for a specific user" do
#       expect{ get :destroy, { id: user.id} }.to change(current_user).from(user).to(nil)
#     end
#   end
# end