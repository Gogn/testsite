class ApplicationController < ActionController::Base
  # before_filter :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
    #redirect_to main_home_url, notice: "reg?"
  end

end
end
