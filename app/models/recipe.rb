class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, presence: true
  validates :public, inclusion: { in: [true, false] }

  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
end
