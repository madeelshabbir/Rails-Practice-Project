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
    # p Person.present?
    # p Person.exists?(2)
    # p Person.pluck
    # p Person.select{ |person| true }
    # p Person.find(1)
    # p Person.find([1,3])
    # p Person.find(1,3)
    # p Person.find(10)
    # p Person.take
    # p Person.take(10)
    # p Person.take!(10)
    # p Person.where(id: 1..5)
    # p Person.first
    # p Person.first(10)
    # p Person.order(:name).first
    # p Person.last
    # p Person.last(10)
    # p Person.order(:name).last
    # p Person.find_by(name: 'Adeel')
    # p Person.find_by!(name: 'Adeel')
    # p Person.where(name: 'Adeel').take
    # Person.find_each do |person|
    #   p person
    # end

    # Person.where(name: 'Adeel').find_each do |person|
    #   p person
    # end

    # Person.find_each(batch_size: 2, start: 2, finish: 5) do |person|
    #   p person
    # end

    # Person.find_in_batches do |person|
    #   p person
    # end

    # Person.find_in_batches(batch_size: 2, start: 2, finish: 5) do |person|
    #   p person
    # end

    # p Person.where('name = ?', 'AdeelShabbir')
    # p Person.where(name: 'AdeelShabbir')
    # p Person.where('name = :name', {name: 'AdeelShabbir'})
    # p Person.where(id: [1,3,5])
    # p Person.where.not(name: 'Adeel')
    # p Person.where.not(name: 'Adeel').or(Person.where(id: [1,3,5]))
    # p Person.order(:name)
    # p Person.order(id: :desc)
    # p Person.order(id: :desc, name: :asc)
    @persons = Person.all
    #puts @person.present?
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
