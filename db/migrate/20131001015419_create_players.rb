class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.boolean :is_dead
      t.integer :role
      t.decimal :lat
      t.decimal :lon
      t.integer :votes_for
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end
