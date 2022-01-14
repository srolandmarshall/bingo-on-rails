class CreateBingoNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :bingo_numbers do |t|
      t.references :bingo_card, foreign_key: true
      t.string :letter, length: { maximum: 1 }, null: false
      t.integer :number, null: false

      t.timestamps
    end
  end
end
