class Api::V1::UserProductsController < ApplicationController

    acts_as_token_authentication_handler_for User

    def user_products_params
        params.require(:user_product).permit(:user_id,:product_id)
    end

    def index
        user_products = UserProduct.all
        render json: user_products, status: :ok
    end
    def show
        user_product = UserProduct.find(params[:id])
        render json: user_product, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        user_product = UserProduct.new(user_products_params)
        user_product.save! # ! retorna erro
        render json: user_product, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def delete
        user_product = UserProduct.find(params[:id])
        user_product.destroy! # ! retorna erro
        render json: {message: "Produto Favorito #{user_product.name} deletado com sucesso"},  status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end
end
