class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :mail
      t.string :password
      t.string :last_name
      t.string :first_name
      t.string :pseudo
      t.integer :nb_round
      t.boolean :is_round_closed
      t.boolean :is_mercato_closed
      t.integer :money

      t.timestamps
    end
  end
end
