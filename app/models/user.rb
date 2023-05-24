class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy

  def is?(role)
    self.role == role.to_s
  end
end
