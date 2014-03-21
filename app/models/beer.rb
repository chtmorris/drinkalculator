class Beer

  include Mongoid::Document
  field :wk1, type: Integer
  field :wk2, type: Integer
  field :wk3, type: Integer
  field :wk4, type: Integer
  field :wk5, type: Integer
  field input_time, type: Integer

  embedded_in :user

  def add_beer (params)
    input_time = Time.now.strftime("%m/%d/%Y")
    self.write_attribute(input_time, params.to_i)
    self.save
  end

end