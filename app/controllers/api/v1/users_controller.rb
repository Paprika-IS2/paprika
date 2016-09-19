class Api::V1::UsersController < ApiController
    respond_to :json

    def index
        #respond_with User.all
        @users = User.all.paginate(:page => params[:page], :per_page => 25)
        render json:    @users,
                        meta: { pagination: {
                            per_page: 25,
                            total_pages: @users.total_pages,
                            total_entries: @users.total_entries,
                            next_page: @users.next_page}},
                        status: 200
    end

    def show
        respond_with User.find(params[:id])
    end

    def login
        if params.key?('email') && params.key?('password')
            @user = User.where("email=?",params['email']).first()
            if @user
                if @user.valid_password?(params['password'])
                    render json: @user, status: 200
                else
                    render json: {errors: "Invalid credentials"}, status: 422
                end
            else
                render json: {errors: "Cannot find user"}, status: 422
            end
        else
            render json: {errors: "Bad request: needs email and password"}, status: 422
        end
    end

end
