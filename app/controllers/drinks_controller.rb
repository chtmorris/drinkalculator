class DrinksController < ApplicationController

  def drinks_form
    if (params[:user][:beer].blank? and params[:user][:wine].blank? and params[:user][:cocktail].blank?)
      redirect_to root_url, notice: "You are Teetotallistic today!  Great job!"
    else
      @binges = current_user.binge.find_or_create_by(params[:date])
      @binges.update_attributes(drink_params)
      redirect_to results_url
    end

  end

  def results
  end

  private

  def drink_params
    params.require(:user).permit(:beer, :wine, :cocktail, :date)
  end

end