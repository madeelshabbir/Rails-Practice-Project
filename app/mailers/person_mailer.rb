class PersonMailer < ApplicationMailer
  before_action { @person = params[:person] }
  default from: 'adeel@devsinc.com'

  def person_signed_up
    attachments['Ruby_On_Rails_Logo.svg'] = File.read("#{Rails.root}/app/assets/images/Ruby_On_Rails_Logo.svg")
    email_with_name = %("#{@person.name}" <#{@person.email}>)
    mail to: email_with_name, subject: 'Thanks for Signing Up'
  end
end
