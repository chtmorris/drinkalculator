class Binge

  include Mongoid::Document
  field :beer, type: Integer
  field :wine, type: Integer
  field :cocktail, type: Integer
  field :date, type: String

  embedded_in :user

  def date (params)
    if params[:date] = nil
      Time.now.strftime("%m/%d/%Y")
      self.save
    else
      params[:date]
      self.save
    end
  end

  # (if params[:date] = nil then (Time.now.strftime("%m/%d/%Y")) else params[:date])

  # def add_beer (params)
  #   input_time = Time.now.strftime("%m/%d/%Y")
  #   self.write_attribute(input_time, params.to_i)
  #   self.save
  # end


end