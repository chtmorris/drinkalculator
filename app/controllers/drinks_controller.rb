class DrinksController < ApplicationController

  def drinks_form
    # if @user.save(drink_params)params[:user][:beer].blank?
    if params[:user][:beer].blank? and params[:user][:wine].blank? and params[:user][:cocktail].blank?
      flash.now[:alert] = "No booze!"
    else
      User.add_drinks
    end
  end

  private

  def drink_params
    params.require(:user).permit(:beer, :wine, :cocktail)
  end

end