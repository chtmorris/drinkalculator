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
    beers = 0
    for drink in current_user.binge
      beers = beers + drink.beer
      @total_beer = beers
    end

    wines = 0
    for drink in current_user.binge
      wines = wines + drink.wine
      @total_wine = wines
    end

    cocktails = 0
    for drink in current_user.binge
      cocktails = cocktails + drink.cocktail
      @total_cocktail = cocktails
    end

    @total_beer_cost = @total_beer * 50
    @total_wine_cost = @total_wine * 60
    @total_cocktail_cost = @total_cocktail * 90

    @total_beer_units = @total_beer * 2
    @total_wine_units = @total_wine * 2
    @total_cocktail_units = @total_cocktail * 3

  end

  private

  def drink_params
    params.require(:user).permit(:beer, :wine, :cocktail, :date)

  end
  # sum(drink.beer.to_i)

end