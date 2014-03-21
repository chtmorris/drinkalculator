class Binge

  include Mongoid::Document
  field :beer, type: Integer
  field :wine, type: Integer
  field :cocktail, type: Integer

  belongs_to :user

  def add_beer (params)
    self.write_attribute(:beer, params.to_i)
    # self.save
  end

  def add_wine (params)
    self.write_attribute(:wine, params.to_i)
    # self.save
  end

  def add_cocktail (params)
    self.write_attribute(:cocktail, params.to_i)
    # self.save
  end




  # def add_beer (params)
  #   input_time = Time.now.strftime("%m/%d/%Y")
  #   self.write_attribute(input_time, params.to_i)
  #   self.save
  # end


end