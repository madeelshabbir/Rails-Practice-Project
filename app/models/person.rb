class Person < ApplicationRecord
  validates :name , presence: true
    # exclusion: { in: %w(Adeel),
    #   message: -> (object, data) do
    #     "Hey #{object.name}!, #{data[:value]} is reserved keyword"
    #   end },
    #uniqueness: { case_sensitive: false }
  validates :number , presence: { message: 'Phone Number is missing' }
    #format: { with: /\A[0-9]+\z/, message: 'Only Numbers' },
    #length: { is: 11 }, numericality: { only_integer: true }

  before_validation :callback_method_before_validation, on: :create

  after_validation do |person|
    puts "After Validation"
  end

  before_save do |person|
    @saved_name = name
    puts "Before Save"
  end

  # around_save do |person|
  #   puts "Around Save"
  # end

  before_create do |person|
    puts "Before Create"
  end

  # around_create do |person|
  #   puts "Around Create"
  # end

  after_create do |person|
    puts "After Create"
  end

  after_save do |person|
    puts "Name is Changed" unless @saved_name == name
    person.errors.add :name, :too_plain, message: 'Name is not changed' if @saved_name == name
    puts "After Save"
  end

  after_commit do |person|
    puts "After Commit"
  end

  after_initialize do |person|
    puts "After Initialziation"
  end

  before_update do |person|
    puts "Before Update"
  end

  # around_update do |person|
  #   puts "Around Update"
  # end

  after_update do |person|
    puts "After Update"
  end

  before_destroy do |person|
    puts "Before Destroy"
  end

  around_destroy do |person|
    puts "Around Destroy"
  end

  after_destroy do |person|
    puts "After Destroy"
  end

  private

  def callback_method_before_validation
    puts "Before Validation"
  end
end
