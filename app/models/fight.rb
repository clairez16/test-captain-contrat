class Fight < ApplicationRecord
  belongs_to :winner, class_name: 'Fighter', optional: true
  belongs_to :loser, class_name: 'Fighter', optional: true
  belongs_to :fighter_1, class_name: 'Fighter'
  belongs_to :fighter_2, class_name: 'Fighter'
  belongs_to :equipement_1, class_name: 'Equipement'
  belongs_to :equipement_2, class_name: 'Equipement'

  has_many :strokes, dependent: :destroy

  validates :fighter_1, :fighter_2, :equipement_1, :equipement_2, presence: true
  validate :check_fighter_1_and_fighter_2

  after_create :run_fight

  private

  def check_fighter_1_and_fighter_2
    errors.add(:fighter_2, "can't be the same as fighter 1") if fighter_1 == fighter_2
  end

  def run_fight
    current_player = rand(2)

    until strokes.where(missed: false, target: fighter_1).map(&:impact).sum >= fighter_1.life_points ||
          strokes.where(missed: false, target: fighter_2).map(&:impact).sum >= fighter_2.life_points

      if current_player % 2 == 0
        Stroke.create(fight: self, owner: fighter_2, target: fighter_1)
      else
        Stroke.create(fight: self, owner: fighter_1, target: fighter_2)
      end

      current_player += 1
    end

    if strokes.where(missed: false, target: fighter_1).map(&:impact)&.sum >= fighter_1.life_points
      loser = fighter_1
      winner = fighter_2
    else
      loser = fighter_2
      winner = fighter_1
    end

    update(winner: winner, loser: loser)
  end
end
