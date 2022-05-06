class Api::V1::ProductsController < ApplicationController

    acts_as_token_authentication_handler_for User,only: [:index,:show]

    

    def products_params
        params.require(:product).permit(:name,:description,:price,:tag_id, articles: [],nutrients: [])
    end

    def index
        products = Product.all
        render json: products, status: :ok
    end

    def show
        product = Product.find(params[:id])
        render json: product, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        product = Product.new(products_params)
        product.save! # ! retorna erro
        render json: product, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        product = Product.find(params[:id])
        product.update!(products_params)
        render json: product, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        product = Product.find(params[:id])
        product.destroy! # ! retorna erro
        render json: {message: "Produto #{product.name} deletado com sucesso"},  status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end
end
