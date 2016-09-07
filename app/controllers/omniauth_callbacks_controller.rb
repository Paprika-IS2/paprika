class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_for_oauth(env["omniauth.auth"], current_user)
 
    if @user.persisted? # Chequea que nuestro usuario se haya guardado en la base de datos y no sea una instancia superficial
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "twitter".capitalize) if is_navigational_format?
    else
      session["devise.twitter_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
 
  def facebook
    @user = User.find_for_oauth(env["omniauth.auth"], current_user)
 
    if @user.persisted? # Chequea que nuestro usuario se haya guardado en la base de datos y no sea una instancia superficial
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "facebook".capitalize) if is_navigational_format?
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
 
  def after_sign_in_path_for(resource) # Revisa después de cada login si el mail del usuario es válido
    if resource.email_verified?
      super resource # Acción por defecto de Devise (si no está configurada, va al root_path)
    else
      finish_signup_path(resource)
    end
  end
 
end