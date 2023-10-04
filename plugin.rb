# name: disable-email-verification-discourse
# about: A plugin to disable email verification in Discourse
# version: 0.0.2
# authors: Coder Gautam
# url: https://github.com/codergautam/disable-email-verification-discourse

after_initialize do
  module AutoActivationPlugin
    require_dependency 'users_controller'
    require_dependency 'user'
    # if !SiteSetting.disable_email_verification
    #   puts "Email verification is enabled"
    # else
    #   puts "Email verification is disabled"
    # end

    User.class_eval do
      def create_email_token
        email_tokens.create(email: email) unless SiteSetting.disable_email_verification
      end
    end

    UsersController.class_eval do
      private

      def modify_user_params(attrs)
        merge_fields = {ip_address: request.ip}
        merge_fields.merge!(active: true) if SiteSetting.disable_email_verification
        attrs.merge!(merge_fields)
        attrs
      end
    end
  end
end
