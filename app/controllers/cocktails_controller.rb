class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @ingredient_list = Ingredient.all
    @dose = Dose.new
    @dose.cocktail = @cocktail

  end

  def new
    @cocktail = Cocktail.new

  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end


  private

  def dose_params
    params.require(:dose).permit(:description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
