class CategoriesController < ApplicationController
  def index
    @categories = Categorie.all
    render json: @categories
  end

  def show
    @categorie = Categorie.find(params[:id])
    render json: @categorie
  end
end
