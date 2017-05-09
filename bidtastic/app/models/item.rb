class Item < ApplicationRecord

  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :minimum_bid, presence: true
  validates :bid_increment, presence: true
end
