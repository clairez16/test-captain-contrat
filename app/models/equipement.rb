class Equipement < ApplicationRecord
  has_many :fighter_equipements
  has_many :fighters, through: :fighter_equipements

  enum category: %i[marketing commercial produit legal]
end
