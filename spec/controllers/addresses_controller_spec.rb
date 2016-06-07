#All address controller test specs written

require 'rails_helper'

describe AddressesController  do
  let(:user){User.create({first_name: "test", last_name: "test", email: "test@test.com", phone_number: "1231231123", password: "Testing1"})}
  let(:valid_attributes){{address_1: "test", city: "test", state: "test", zip: "12345"}}
  let(:valid_session){{}}

  describe 'GET #new' do
    it "it assigns @address to a new blank address" do
      get :new, {}, valid_session
      expect(assigns[:address]).to be_a_new(Address)
    end
  end

  describe 'POST #create' do
    describe 'with valid params' do
      it "creates a new Address" do
        allow(controller).to receive(:current_user) { user }
        expect { post :create, {address: valid_attributes},valid_session}.to change(Address, :count).by(1)
      end
      it "it assigns a newly created address to @address" do
        allow(controller).to receive(:current_user) { user }
        post :create, {address: valid_attributes}, valid_session
        expect(assigns[:address]).to be_a(Address)
        expect(assigns[:address]).to be_persisted
      end
      it "redirects to the user page" do
        allow(controller).to receive(:current_user) { user }
        post :create, {address: valid_attributes}, valid_session
        expect(response).to redirect_to(user)
      end
    end
    describe "with invalid params" do
      it "assigns a newly created but unsaved address as @address" do
        allow(controller).to receive(:current_user) { user }
        allow_any_instance_of(Address).to receive(:save).and_return(false)
        post :create, {:address=> { "zip" => "invalid value" }}, valid_session
        expect(assigns[:address]).to be_a_new(Address)
      end

      it "re-renders the 'new' template" do
        allow(controller).to receive(:current_user) { user }
        allow_any_instance_of(Address).to receive(:save).and_return(false)
        post :create, {:address => { "zip" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
