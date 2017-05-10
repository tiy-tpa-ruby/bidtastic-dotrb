class Bid < ApplicationRecord
  belongs_to :item
  belongs_to :created_by, class_name: "User"

  validates :bid_amount, presence: true

  validate :bid_amount_exceeds_minimum

  def bid_amount_exceeds_minimum
    if bid_amount < item.next_minimum_bid
      errors.add(:bid_amount, "Must be at least #{item.next_minimum_bid}")
    end
  end
end
