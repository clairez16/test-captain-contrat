class Fight < ApplicationRecord
  belongs_to :winner, class_name: 'Fighter', optional: true
  belongs_to :loser, class_name: 'Fighter', optional: true

  has_many :strokes, dependent: :destroy
  has_many :fight_fighters, dependent: :destroy, index_errors: true
  has_many :fighters, through: :fight_fighters

  accepts_nested_attributes_for :fight_fighters, allow_destroy: true

  validates_associated :fight_fighters
  validate :check_different_fighters

  after_create :run_fight

  private

  def check_different_fighters
    first_fighter_id = nil
    fight_fighters.each do |fight_fighter|
      if first_fighter_id.nil?
        first_fighter_id = fight_fighter.fighter_id
      elsif first_fighter_id == fight_fighter.fighter_id
        errors['fight_fighters[0].fighter'] << "you should choose two different fighters!"
      end
    end
  end

  def run_fight
    fighter_1 = fight_fighters[0]
    fighter_2 = fight_fighters[1]

    current_player = rand(2) # chooses randomly first player

    until strokes.where(missed: false, target: fighter_1.fighter).map(&:impact).sum >= fighter_1.fighter.life_points ||
          strokes.where(missed: false, target: fighter_2.fighter).map(&:impact).sum >= fighter_2.fighter.life_points

      if current_player.even?
        Stroke.create(fight: self, owner: fighter_2.fighter, target: fighter_1.fighter, attack_equipement: fighter_2.equipement, defense_equipement: fighter_1.equipement)
      else
        Stroke.create(fight: self, owner: fighter_1.fighter, target: fighter_2.fighter, attack_equipement: fighter_1.equipement, defense_equipement: fighter_2.equipement)
      end

      current_player += 1
    end

    if strokes.where(missed: false, target: fighter_1.fighter).map(&:impact).sum >= fighter_1.fighter.life_points
      loser, winner = fighter_1.fighter, fighter_2.fighter
    else
      loser, winner = fighter_2.fighter, fighter_1.fighter
    end

    update(winner: winner, loser: loser)
    winner.increment!(:experience)
  end
end
