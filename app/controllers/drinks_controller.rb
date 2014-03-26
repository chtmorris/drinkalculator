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

  end

  private

  def drink_params
    params.require(:user).permit(:beer, :wine, :cocktail, :date)

  end
  # sum(drink.beer.to_i)

end