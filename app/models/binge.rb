class Binge

  include Mongoid::Document
  field :beer, type: Integer
  field :wine, type: Integer
  field :cocktail, type: Integer
  field :date, type: String

  embedded_in :user


end