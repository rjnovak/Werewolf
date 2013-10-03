class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.time :start
      t.integer :interval

      t.timestamps
    end
  end
end
