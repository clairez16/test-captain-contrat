class Fight < ApplicationRecord
  belongs_to :winner, class_name: 'Fighter'
  belongs_to :fighter_1, class_name: 'Fighter'
  belongs_to :fighter_2, class_name: 'Fighter'
  belongs_to :equipement_1, class_name: 'Equipement'
  belongs_to :equipement_2, class_name: 'Equipement'

  has_many :strokes, dependent: :destroy

  validates :fighter_1, :fighter_2, :equipement_1, :equipement_2, presence: true
  validate :check_fighter_1_and_fighter_2

  private

  def check_fighter_1_and_fighter_2
    errors.add(:fighter_2, "can't be the same as fighter 1") if fighter_1 == fighter_2
  end
end
