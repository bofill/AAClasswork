class CatsController < ApplicationController
    # COLOR = %w(red, white, gray, black)
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params["id"])
        render :show
    end
    def new 
        @cat = Cat.new 
        # @colors = COLOR
        render :new 
    end 

    def create 
        cat = Cat.new(cat_params)
        if cat.save
            redirect_to cat_url(cat)
        else 
            render json: cat.errors.full_messages, status: 422 
        end 
    end 

    def edit 
        @cat = Cat.find(params[:id])
        # @colors = COLOR
        render :edit 
    end 

    def update  
        cat = Cat.find_by(id: params[:id])
        if cat.update(cat_params)
            redirect_to cat_url(cat)
        else 
            render json: cat.errors.full_messages, status: :unprocessable_entity 
        end 
    end

    def destroy 
        cat = Cat.find(params[:id])
        cat.destroy 
        redirect_to cats_url
    end




    private 
    def cat_params 
        params.require(:cat).permit(:name, :birth_date, :color, :description, :sex)
    end     
end