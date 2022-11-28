class PizzasController < ApplicationController
    def index
        pizza = Pizza.all
        render json: pizza
    end
    def show
        pizzas = Pizza.all
        render json: pizzas
    end
    def Create
            pizza = Pizza.create(pizza_params)
            render jsonn: pizza
    end
    def update
        pizza = Pizza.find(params[:id])
        pizza.update(pizza_params)
        render json pizza
    end
    def destroy
        pizza = Pizza.find(params [:id])
        pizza.destroy
        render json: pizza
    end
    private
    def pizza_params
        params.require(:pizza).permit(:name, :ingredients)
    end
end
