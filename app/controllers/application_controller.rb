class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username << :account_type
  end

  def after_sign_in_path_for(resource)
    if current_user.account_type == "Artist" 
      artist_path(resource)
    elsif current_user.account_type ==  "Label"
      label_path(resource)
    end
  end

end
