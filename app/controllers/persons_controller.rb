class PersonsController < ApplicationController
  before_action :show_all

  def new
  end

  def index
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person
    else
      render "new"
    end
  end

  def show
    @person = Person.find_by_id(params[:id])
  end

  private

  def show_all
    @persons = Person.all
  end

  def person_params
    params.require(:person).permit(:name, :number)
    #params.require(:person).permit!
  end
end
