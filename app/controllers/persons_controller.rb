class PersonsController < ApplicationController
  #before_action :show_all
  #layout 'person', only: :show

  before_action :authenticate_user!, except: [:index, :show]

  def new
    @person = Person.new
  end

  def index
    #p session[:person]
    #p flash[:person]
    @persons = Person.all
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      PersonMailer.with(person: @person).person_signed_up.deliver_later
      redirect_to @person
    else
      render 'new'
      #render 'new',  layout: 'person'
    end
  end

  def show
    @person = Person.find_by_id(params[:id])
    # session[:person] = @person
    # p session[:person]
    # # reset_session
    # session.delete(:person)
    # p session[:person]
    # cookies[:person] = @person
    # p cookies[:person]
    # cookies.delete(:person)
    # p cookies[:person]
    # flash[:person] = @person
    # p flash[:person]
    # flash.clear
    # p flash[:person]
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
