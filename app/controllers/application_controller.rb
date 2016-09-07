class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_new_column_to_devise_permitted_parameters, if: :devise_controller?

  private
  def set_locale
    # Rails.application.routes.default_url_options[:locale]= I18n.locale
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
        puts "#{params[:locale]} This."
      else
        flash.now[:alert] = "#{params[:locale]} translation is not available."
      end
    end
  end

  def configure_new_column_to_devise_permitted_parameters
    registration_params = [:name, :lastname, :email, :password, :password_confirmation]
    if params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname])
    elsif params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname])
    end
  end

end
