class Fighter < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :won_fights, class_name: 'Fight', foreign_key: 'winner_id', dependent: :destroy
  has_many :lost_fights, class_name: 'Fight', foreign_key: 'loser_id', dependent: :destroy

  has_many :given_strokes, class_name: 'Stroke', foreign_key: 'owner_id', dependent: :destroy
  has_many :received_strokes, class_name: 'Stroke', foreign_key: 'target_id', dependent: :destroy

  validates :name, :life_points, :attack_points, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }
  validates :life_points, :attack_points, inclusion: { in: ((1..99)),
  message: "should be between 1 and 99" }
  validate :sum_equals_100

  def percentage_of_victory
    fights
  end

  private

  def sum_equals_100
    return unless life_points + attack_points != 100

    errors.add(:base, "The sum of your life points and attack points should be equal to 100")
  end
end
