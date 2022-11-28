class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    #POST new restaurant_pizza
    def create
        restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        #returns the new entity and status
        render json: restaurant_pizza, status: :created
    end
    #Get all the restaurant_pizzas
    def index
        render json: RestaurantPizza.all
    end
    #GET restaurant_pizza/:id
    def show
        restaurant_pizza = find_restaurant_pizza
        render json: restaurant_pizza
    end
    private
    def restaurant_pizza_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end
    def unprocessable_entity_method entity
        render json: {errors: entity.record.errors}, status: :unprocessable_entity
    end
    def find_restaurant_pizza
        RestaurantPizza.find_by!(id: params[:id])
    end
    def record_not_found
        render json: {error: "RestaurantPizza Not Found"}, status: :not_found
    end
end
