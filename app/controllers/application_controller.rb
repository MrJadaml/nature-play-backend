class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def show
    render json: @parks
  end

  def current_user
    @current_user ||= begin
      auth_token = request.env['HTTP_X_AUTHENTICATION_TOKEN']
      User.find_by(auth_token: auth_token) if !!auth_token
    end
  end
end
