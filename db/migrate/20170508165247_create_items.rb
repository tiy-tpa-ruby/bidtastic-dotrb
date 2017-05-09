class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :created_by
      t.string :category
      t.integer :minimum_bid
      t.integer :bid_increment
      t.text :image_data

      t.timestamps
    end
  end
end
