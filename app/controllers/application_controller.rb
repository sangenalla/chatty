class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate, :except => :login

  def login
    if authenticated?
      redirect_to '/messages'
    else
      unless request.get?
        puts "came here"
        email = params[:email]
        login_user = User.find_by_email(email)
        if login_user.present?
          session[:user_email] = email
          redirect_to '/messages', :notice => "Successfully Logged in"
        else
          redirect_to '/login', :flash => { :error => 'Invalid User'}
        end
      end
    end
  end

  def logout
    session[:user_email] = ""
    redirect_to '/login', :flash => { :notice => 'Logged Out'}
  end

  def authenticated?
    session[:user_email].present?
  end

  def authenticate
    redirect_to '/login' unless authenticated?
    @current_user = User.find_by_email(session[:user_email])
  end
end
