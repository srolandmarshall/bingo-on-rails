class CreateBingoCards < ActiveRecord::Migration[7.0]
  def change
    create_table :bingo_cards do |t|
      t.boolean :winner, null: false, default: false
      
      t.timestamps
    end
  end
end
