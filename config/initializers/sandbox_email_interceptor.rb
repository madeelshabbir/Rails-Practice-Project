# class SandboxEmailInterceptor
#   def self.delivering_email(message)
#     message.to = ['adeelspro@gmail.com']
#   end
# end
# if Rails.env.staging?
#   ActionMailer::Base.register_interceptor(SandboxEmailInterceptor)
# end
