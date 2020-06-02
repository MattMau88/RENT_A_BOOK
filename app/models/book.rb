class Book < ApplicationRecord
  belongs_to :owner, class_name: "User"

  has_many :rentals

  has_one_attached :photo

  validates :title, :author, :description, :category, :rental_fee_per_day, presence: true

  scope :rented, -> { where(rented: true) }

end
