class Binge

  include Mongoid::Document
  field :beer, type: Integer, default: 0
  field :wine, type: Integer, default: 0
  field :cocktail, type: Integer, default: 0
  field :date, type: String

  embedded_in :user


end