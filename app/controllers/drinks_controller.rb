class DrinksController < ApplicationController

  def drinks_form
    if (params[:user][:beer].blank? and params[:user][:wine].blank? and params[:user][:cocktail].blank?)
      # flash.now[:alert] = "No booze!"
      redirect_to root_url, notice: "You are Teetotallistic today!  Great job!"
    else
      current_user.add_drinks(drink_params)
      redirect_to results_url
    end

  end

  def results
  end

  private

  def drink_params
    params.require(:user).permit(:beer, :wine, :cocktail)
  end

end