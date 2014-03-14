class SiteController < ApplicationController

  before_action :is_authenticated?

  def index
    # render text: is_authenticated?
    @users = User.all.entries
  end

  def privacy
  end

  def terms
  end

end
