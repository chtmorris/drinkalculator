class Beer

  include Mongoid::Document
  field :wk1, type: Integer
  field :wk2, type: Integer
  field :wk3, type: Integer
  field :wk4, type: Integer
  field :wk5, type: Integer

  embedded_in :user

  def add_beer (params)
    unless params[:beer].blank?
      self.wk1 = self.wk1 + params[:beer].to_i
      self.save
    end
  end

end