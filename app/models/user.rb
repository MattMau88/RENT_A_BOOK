class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy, source: :books, foreign_key: :owner_id
  has_many :rentals_as_rentee, class_name: 'Rental', foreign_key: :rentee_id
  has_many :rentals_as_owner, through: :books, source: :rentals, foreign_key: :owner_id

  validates :full_name, presence: true
  has_one_attached :photo
end
