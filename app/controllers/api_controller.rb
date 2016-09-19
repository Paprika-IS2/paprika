class ApiController < ApplicationController
    protect_from_forgery with: :null_session, prepend: true
    before_action :authenticate_user_from_token!, only:[:create, :update, :destroy, :show, :index]

    private def authenticate_user_from_token!
        if !params.key?('api_token')
            render json: {errors: "No api_token given"}, status: 401
        else
            @user = nil
            User.all.each do |u|
                if Devise.secure_compare(u.auth_token, params['api_token'])
                    @user = u
                end
            end
        end
    end

end
