class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.integer :price
      t.boolean :is_win
      t.integer :nb_round
      t.references :user, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
