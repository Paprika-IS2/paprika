class Api::V1::RecipesController < ApiController
    respond_to :json
    def index
        #respond_with Recipe.all
        @recipes = Recipe.all.paginate(:page => params[:page], :per_page => 25)
        render json:    @recipes,
                        meta: { pagination: {
                            per_page: 25,
                            total_pages: @recipes.total_pages,
                            total_entries: @recipes.total_entries,
                            next_page: @recipes.next_page}},
                        status: 200
    end
    def show
        respond_with Recipe.find(params[:id])
    end
end
