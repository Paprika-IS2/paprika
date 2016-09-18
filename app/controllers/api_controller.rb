class ApiController < ApplicationController
    protect_from_forgery with: :null_session, prepend: true
    before_action :authenticate_user_from_token!, only:[:create, :update, :destroy]

    private def authenticate_user_from_token!
        if !params.key?('api_token')
            head 401, content_type: "text/html"
        else
            @user = nil
            User.all.each do |u|
                if Devise.secure_compare(u.auth_token, param.key['api_token'])
                    @user = u
                end
            end
        end
    end

end
