class CreateJoinTableBingoCardsBingoNumbers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :bingo_cards, :bingo_numbers do |t|
      t.index [:bingo_card_id, :bingo_number_id]
      t.index [:bingo_number_id, :bingo_card_id]
    end
  end
end
