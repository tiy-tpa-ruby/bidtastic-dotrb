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
end
