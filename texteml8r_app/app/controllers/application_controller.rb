class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_user

  # "env": {
  #   "TWILIO_ACCOUNT_SID": {
  #     "description": "Your Twilio account secret ID, you can find at: https://www.twilio.com/user/account",
  #     "value": "enter_your_account_sid_here",
  #     "required": true
  #   },
  #   "TWILIO_AUTH_TOKEN": {
  #     "description": "Your secret Twilio Auth token, you can find at: https://www.twilio.com/user/account",
  #     "value": "enter_your_auth_token_here",
  #     "required": true
  #   },
  #   "TWILIO_NUMBER": {
  #     "description": "The Twilio phone number you are using for this app. You can get one here: https://www.twilio.com/user/account/phone-numbers/incoming",
  #     "value": "+15005550006",
  #     "required": true
  #   },
  #   "HEROKU_API_KEY": {
  #     "description": "Used for workless gem. You can find this at: https://dashboard.heroku.com/account",
  #     "value": "enter_your_api_key_here",
  #     "required": true
  #   },
  #   "APP_NAME": {
  #     "description": "Used for workless gem. Define one above where it says 'App Name (optional)'.",
  #     "value": "app_name",
  #     "required": true
  #   },
  # },

  def current_user
    User.find(session[:current_user]) if session[:current_user]
  end


  def authenticate
    if !current_user
      redirect_to sessions_new_path
    end
  end



  def index

  end


end

