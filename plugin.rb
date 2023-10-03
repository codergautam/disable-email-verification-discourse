# name: disable-email-verification
# about: A plugin to disable email verification in Discourse
# version: 0.0.1
# authors: Coder Gautam
# url: https://github.com/codergautam/disable-email-verification-discourse

 # This code block disables email verification in Discourse
 # It does so by modifying the UsersController and User classes
 # Specifically, it modifies the user_params method in UsersController
 # and the create_email_token method in User
 # It only does so if SiteSetting.disable_email_verification is false
 after_initialize do
   module AutoActivationPlugin
     require_dependency 'users_controller'
     require_dependency 'user'

     User.class_eval do
       # This method creates an email token for the user
       # It only does so if SiteSetting.disable_email_verification is false
       def create_email_token
         email_tokens.create(email: email) unless SiteSetting.disable_email_verification
       end
     end

     UsersController.class_eval do
       private
       # This method modifies the user_params method in UsersController
       # It sets the active field to true if SiteSetting.disable_email_verification is true
       def user_params
         merge_fields = {ip_address: request.ip}
         merge_fields.merge!(active: true) if SiteSetting.disable_email_verification
         params.permit!
         params.merge(merge_fields)
       end
     end
   end
 end
