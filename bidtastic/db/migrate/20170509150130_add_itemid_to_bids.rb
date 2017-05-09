class AddItemidToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :item_id, :integer
  end
end
