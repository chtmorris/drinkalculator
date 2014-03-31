class Binge

  include Mongoid::Document
  field :beer, type: Integer, default: 0
  field :wine, type: Integer, default: 0
  field :cocktail, type: Integer, default: 0
  field :beercost, type: Integer, default: 50
  field :winecost, type: Integer, default: 60
  field :cocktailcost, type: Integer, default: 100
  field :beerunit, type: Integer, default: 3
  field :wineunit, type: Integer, default: 2
  field :cocktailunit, type: Integer, default: 5
  field :date, type: String

  embedded_in :user


end