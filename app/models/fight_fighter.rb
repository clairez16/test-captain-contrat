class FightFighter < ApplicationRecord
  belongs_to :fight, optional: true
  belongs_to :fighter
  belongs_to :equipement

  validates :fighter, :equipement, presence: true
end
