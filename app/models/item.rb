class Item < ApplicationRecord
  include ImageUploader[:image]

  has_many :favorites, dependent: :destroy
  has_many :bids

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :minimum_bid, presence: true
  validates :bid_increment, presence: true

  def largest_bid_amount
    # equivalent, shortcuts -- "symbol to proc"
    bids.max_by(&:bid_amount).bid_amount
  end

  def bid_winner
    bids.max_by(&:bid_amount).created_by.name
  end

  def next_minimum_bid
    bids_in_order = self.bids.order(:bid_amount)

    if bids_in_order.none?
      self.minimum_bid
    else
      highest_bid_so_far = bids_in_order.last

      highest_bid_so_far.bid_amount + self.bid_increment
    end
  end
end
