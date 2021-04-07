# Preview all emails at http://localhost:3000/rails/mailers/person_mailer
class PersonMailerPreview < ActionMailer::Preview
  def person_signed_up
    PersonMailer.with(person: Person.first).person_signed_up
  end
end
