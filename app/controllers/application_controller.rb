class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate, :except => :login
  def login
    email = params[:email]
    login_user = User.find_by_email(email)
    if login_user.present?
      session[:user_email] = email
      redirect_to '/messages'
    else
      redirect_to '/login', :error => 'Invalid User'
    end
  end
end
