class Rental < ApplicationRecord
  belongs_to :book
  belongs_to :rentee, class_name: "User"

  validates :pickup_location, presence: true
  validates :pickup_date, presence: true
  validates :return_date, presence: true
end
