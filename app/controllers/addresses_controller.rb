class AddressesController < ApplicationController

	def new
		@address = Address.new
	end

	def create
		@address = Address.create(addresses_params)
		current_user.addresses << @address
		if @address.save
			redirect_to user_path(current_user.id)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def addresses_params
		params.require(:address).permit(:address_1, :address_type, :user_id, :city, :state, :zip)
	end
end
