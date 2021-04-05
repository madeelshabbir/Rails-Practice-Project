class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def new
    @person = Person.find_by_id(params[:person_id])
  end

  def create
    @person = Person.find_by_id(params[:person_id])
    @person.address = Address.new(address_params)
    @person.save
    redirect_to person_path(@person)
  end

  private

  def address_params
    params.require(:address).permit(:house, :street, :area)
  end
end
