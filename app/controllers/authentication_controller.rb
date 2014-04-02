class AuthenticationController < Devise::OmniauthCallbacksController
  def twitter
    @cyclist = Cyclist.find_by_twitter_auth env['omniauth.auth']

    if @cyclist.persisted?
      sign_in_and_redirect @cyclist, event: :authentication
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
