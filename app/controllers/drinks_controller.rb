class DrinksController < ApplicationController

  def drinks_form
    if blank_form
      redirect_to root_url, notice: "You are Teetotallistic today!  Great job!"
    else
      # set_empty_form_field_to_0 drink_params
      @binges = current_user.binge.find_or_create_by(date: "#{Time.now.strftime("%-d/%m/%Y")}")
      @binges.update_attributes(drink_params)
      redirect_to results_url
    end

  end

  def set_empty_form_field_to_0 params
    # params.each{|k,v| v.nil? ? params[k]=0 : params[k]=v}
    if params == nil
      return params = 0
    else
      params = params
    end
  end

  def blank_form
    params[:user][:beer].blank? and params[:user][:wine].blank? and params[:user][:cocktail].blank?
  end

  def results
  end

  private

  def drink_params
    params.require(:user).permit(:beer, :wine, :cocktail, :date)
    # params.each{|k,v| v.nil? ? params[k]=0 : params[k]=v}

  end

end