class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  alias_method :devise_current_user, :current_user
  #helper_method :owned

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username 
  end

  def after_sign_in_path_for(resource)
    if resource.account_type == "Artist" 
      artist_path(resource.account)
    elsif resource.account_type ==  "Label"
      label_path(resource.account)
    else resource.account_type == "Fan"
      fan_path(resource.account)
    end
  end

  def current_user
    if params[:user_id].blank?
      devise_current_user
    else
      User.find(params[:user_id])
    end   
  end

  def owned
    #redirect_to root_url unless current_user[:account_id] == @artist.id
    #current_user[:account_id] == @artist.id
  end

end
