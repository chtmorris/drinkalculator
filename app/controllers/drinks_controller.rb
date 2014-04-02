class DrinksController < ApplicationController

  def drinks_form
    if blank_form
      redirect_to root_url, notice: "You are Teetotallistic today!  Great job!"
    else
      @binges = current_user.binge.find_or_create_by(date: "#{Time.now.strftime("%-d/%m/%Y")}")
      @binges.update_attributes(drink_params)
      redirect_to results_url
    end
  end

  def blank_form
    params[:user][:beer].blank? and params[:user][:wine].blank? and params[:user][:cocktail].blank?
  end

  def results
    @total_beer = current_user.total_beer
    @total_wine = current_user.total_wine
    @total_cocktail = current_user.total_cocktail

    @total_beer_cost = current_user.beercost
    @total_wine_cost = current_user.winecost
    @total_cocktail_cost = current_user.cocktailcost

    @total_beer_units = current_user.beerunit
    @total_wine_units = current_user.wineunit
    @total_cocktail_units = current_user.cocktailunit
  end


  private

  def drink_params
    params.require(:user).permit(:beer, :wine, :cocktail, :date, :beercost, :winecost, :cocktailcost)
  end

end