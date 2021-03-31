class PersonsController < ApplicationController
  def new
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

  end

  private

  def find
    @person = Person.find_by_id(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :number)
    #params.require(:person).permit!
  end
end
