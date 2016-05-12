class DosesController < ApplicationController
before_action :set_cocktail, only: [ :new, :create, :destroy ]

  def new
    @dose = Dose.new
    @ingredient_list = Ingredient.all
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    @ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose.ingredient = @ingredient
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
