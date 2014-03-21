class Beer

  include Mongoid::Document
  field :wk1, type: Integer
  field :wk2, type: Integer
  field :wk3, type: Integer
  field :wk4, type: Integer
  field :wk5, type: Integer

  embedded_in :user

  def add_beer (params)

    if self.wk1 < 1
      self.wk1 = 0
      self.wk1 = params.to_i
      self.save
    elsif self.wk1 > 0
      self.wk2 = params.to_i
      self.save
    end
  end

end