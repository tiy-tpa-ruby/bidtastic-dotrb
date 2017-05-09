class Bid < ApplicationRecord
  belongs_to :item
  belongs_to :created_by, class_name: "User"

  validates :bid_amount, presence: true
end
