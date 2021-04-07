class PersonMailer < ApplicationMailer
  before_action { @person = params[:person] }
  default from: 'thedigimart@gmail.com'

  def person_signed_up
    attachments['Ruby_On_Rails_Logo.svg'] = File.read("#{Rails.root}/app/assets/images/Ruby_On_Rails_Logo.svg")
    email_with_name = %("#{@person.name}" <#{@person.email}>)
    mail to: email_with_name, subject: 'Thanks for Signing Up'
  end

  # def receive(email)
  #   page = Page.find_by(address: email.to.first)
  #   page.emails.create(
  #     subject: email.subject,
  #     body: email.body
  #   )

  #   if email.has_attachments?
  #     email.attachments.each do |attachment|
  #       page.attachments.create({
  #         file: attachment,
  #         description: email.subject
  #       })
  #     end
  #   end
  # end
end
