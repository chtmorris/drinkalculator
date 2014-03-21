class Wine

  include Mongoid::Document
  field :wk1, type: Integer
  embedded_in :user

  def add_wine (params)
    input_time = Time.now.strftime("%m/%d/%Y")
    self.write_attribute(input_time, params.to_i)
    self.save
  end

end