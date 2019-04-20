class Fighter < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :fights, dependent: :destroy
  has_many :strokes, dependent: :destroy
  has_many :fighter_equipements, dependent: :destroy
  has_many :equipements, through: :fighter_equipements

  validates :name, :life_points, :attack_points, :category, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }
  validates :life_points, :attack_points, inclusion: { in: ((1..99)),
  message: "should be between 1 and 99" }
  validate :sum_equals_100

  enum category: %i[marketing commercial produit legal]

  private

  def sum_equals_100
    return unless life_points + attack_points != 100

    errors.add(:base, "The sum of your life points and attack points should be equal to 100")
  end
end
