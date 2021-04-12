module Personable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!, except: [:index, :show]
  end

  # def index
    # @persons = Person.includes(:address).all
  # end
end
