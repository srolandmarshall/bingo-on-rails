class CreateBingoNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :bingo_numbers do |t|
      t.integer :number
      t.string :letter

      t.timestamps
    end
  end
end
