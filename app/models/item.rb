class Item < ApplicationRecord
  include ImageUploader[:image]

  has_many :favorites, dependent: :destroy
  has_many :bids

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :minimum_bid, presence: true
  validates :bid_increment, presence: true
  validates :image_data, presence: true

  def self.categories
    %W(Leisure Attire Jewelry Art Memorabilia/Antiques Other)
  end

  def largest_bid_amount
    # equivalent, shortcuts -- "symbol to proc"
    big_bid = bids.max_by(&:bid_amount)
    big_bid ? big_bid.bid_amount : "No Bids"
  end

  def bid_winner
    winner = bids.max_by(&:bid_amount)

    winner ? winner.created_by.name : "No Winner"
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
