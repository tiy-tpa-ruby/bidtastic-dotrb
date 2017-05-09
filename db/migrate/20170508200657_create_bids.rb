class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :created_by_id
      t.integer :bid_amount

      t.timestamps
    end
  end
end
