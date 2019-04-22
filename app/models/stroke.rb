class Stroke < ApplicationRecord
  belongs_to :fight
  belongs_to :owner, class_name: 'Fighter'
  belongs_to :target, class_name: 'Fighter'
  belongs_to :attack_equipement, class_name: 'Equipement'
  belongs_to :defense_equipement, class_name: 'Equipement'

  after_create :run_strike

  RNG = 10 # to add a little chance in the outcome of the fights

  def decorated
    if missed
      "#{owner.name} missed #{target.name}"
    else
      "#{owner.name} inflicted #{impact} points of damage to #{target.name}"
    end
  end

  private

  def run_strike
    update(impact: owner.attack_points + attack_equipement.attack_points - defense_equipement.defense_points)
    update(missed: true) if rand(RNG) == 1
  end
end
