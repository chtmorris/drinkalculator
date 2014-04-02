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
      beers = beers + drink.beer.to_i
      @total_beer = beers
    end

    wines = 0
    for drink in current_user.binge
      wines = wines + drink.wine.to_i
      @total_wine = wines
    end

    cocktails = 0
    for drink in current_user.binge
      cocktails = cocktails + drink.cocktail.to_i
      @total_cocktail = cocktails
    end

    beercost = 0
    for drink in current_user.binge
      beercost = beercost + (drink.beercost.to_i * drink.beer.to_i)
      @total_beer_cost = beercost
    end

    winecost = 0
    for drink in current_user.binge
      winecost = winecost + (drink.winecost.to_i * drink.wine.to_i)
      @total_wine_cost = winecost
    end

    cocktailcost = 0
    for drink in current_user.binge
      cocktailcost = cocktailcost + (drink.cocktailcost.to_i * drink.cocktail.to_i)
      @total_cocktail_cost = cocktailcost
    end

    beerunit = 0
    for drink in current_user.binge
      beerunit = beerunit + (drink.beerunit.to_i * drink.beer.to_i)
      @total_beer_units = beerunit
    end

    wineunit = 0
    for drink in current_user.binge
      wineunit = wineunit + (drink.wineunit.to_i * drink.wine.to_i)
      @total_wine_units = wineunit
    end

    cocktailunit = 0
    for drink in current_user.binge
      cocktailunit = cocktailunit + (drink.cocktailunit.to_i * drink.cocktail.to_i)
      @total_cocktail_units = cocktailunit
    end

  end

  private

  def drink_params
    params.require(:user).permit(:beer, :wine, :cocktail, :date, :beercost, :winecost, :cocktailcost)

  end
  # sum(drink.beer.to_i)

end