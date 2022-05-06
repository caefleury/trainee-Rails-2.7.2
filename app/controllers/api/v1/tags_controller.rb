class Api::V1::TagsController < ApplicationController
    
    acts_as_token_authentication_handler_for User,only: [:index,:show]

    def index
        tags = Tag.all
        render json: tags, status: :ok
    end

    def show
        tag = Tag.find(params[:id])
        render json: tag, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        tag = Tag.new(tags_params)
        tag.save! # ! retorna erro
        render json: tag, status: :created
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def tags_params
        params.require(:tag).permit(:name)
    end

    def update
        tag = Tag.find(params[:id])
        tag.update!(tags_params)
        render json: tag, status: :ok
    rescue StandardError => e
        render json: e, status: :unprocessable_entity
    end

    def delete
        tag = Tag.find(params[:id])
        tag.destroy! # ! retorna erro
        render json: {message: "Categoria #{tag.name} deletada com sucesso"},  status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end
end
