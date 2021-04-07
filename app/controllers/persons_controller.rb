class PersonsController < ApplicationController
  #before_action :show_all
  #layout 'person', only: :show

  def new
    @person = Person.new
  end

  def index
    @persons = Person.all
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person
    else
      render 'new'
      #render 'new',  layout: 'person'
    end
  end

  def show
    @person = Person.find_by_id(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to @person
    else
      render 'edit'
    end
  end

  private

  # def show_all
  #   @persons = Person.all
  # end

  def person_params
    params.require(:person).permit(:name, :number, :email)
    #params.require(:person).permit!
  end
end
