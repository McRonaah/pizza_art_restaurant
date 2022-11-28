class RestaurantsController < ApplicationController
    def index
        restaurant = Restaurant.all
        render json: restaurant
    end
    def show
        restaurant = Restaurant.all
        render json: restaurant
    end
    def Create
            restaurant = Restaurant.create(restaurant_params)
            render jsonn: restaurant
    end
    def update
        restaurant = Restaurant.find(params[:id])
        restaurant.update(restaurant_params)
        render json restaurant
    end
    def destroy
        restaurant = Restaurant.find(params [:id])
        restaurant.destroy
        render json: restaurant
    end
    private
    def restaurant_params
        params.require(:restaurant).permit(:name, :address)
    end
end
