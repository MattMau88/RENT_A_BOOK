class Book < ApplicationRecord
  CATEGORIES = ["Action", "Business", "Biography", "Children", "Crime", "Comic", "Education", "Fantasy", "Humor", "Horror", "Romance", "Mystery", "Satire", "Sci-Fi", "Self-help" ]
  belongs_to :owner, class_name: "User"

  has_many :rentals

  has_one_attached :photo

  validates :title, :author, :description, :rental_fee_per_day, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  scope :rented, -> { where(rented: true) }
end
