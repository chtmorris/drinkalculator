class Binge

  include Mongoid::Document
  field :beer, type: Integer
  field :wine, type: Integer
  field :cocktail, type: Integer

  embedded_in :user

  # def add_beer (params)
  #   input_time = Time.now.strftime("%m/%d/%Y")
  #   self.write_attribute(input_time, params.to_i)
  #   self.save
  # end


end