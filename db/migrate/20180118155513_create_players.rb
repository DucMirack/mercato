class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :min_price
      t.string :position
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
