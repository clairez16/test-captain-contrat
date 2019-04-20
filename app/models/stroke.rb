class Stroke < ApplicationRecord
  belongs_to :fight
  belongs_to :owner, class_name: 'Fighter'
  belongs_to :target, class_name: 'Fighter'

  belongs_to :fighter

  before_save :

  RNG = 10


end
