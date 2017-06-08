class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    puts '0.9 auth >>>'
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      puts '1.1 found >>>>'
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      puts '1.1 Sorry NOT found ! >>>>'
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
