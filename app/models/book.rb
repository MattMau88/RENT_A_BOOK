class Book < ApplicationRecord
  belongs_to :owner, class_name: "User"

  has_many :rentals

  # add after activestorage migration

  validates :title, :author, :description, :category, :rental_fee_per_day, presence: true

  scope :rented, -> { where(rented: true) }
  has_one_attached :photo
end
