class AddBingoNumbersReferencesToBingoCard < ActiveRecord::Migration[7.0]
  def change
    add_reference :bingo_cards, :bingo_numbers, null: false, foreign_key: true
  end
end
