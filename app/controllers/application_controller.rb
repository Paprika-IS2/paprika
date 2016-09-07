class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

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
end
