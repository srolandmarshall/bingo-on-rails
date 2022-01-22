class CreateJoinTableBingoNumbersBingoCardsBingoGames < ActiveRecord::Migration[7.0]
  def change
    create_join_table :bingo_cards, :bingo_games do |t|
      t.index [:bingo_card_id, :bingo_game_id]
      t.index [:bingo_game_id, :bingo_card_id]
    end
    create_join_table :bingo_numbers, :bingo_games do |t|
      t.index [:bingo_number_id, :bingo_game_id]
      t.index [:bingo_game_id, :bingo_number_id]
    end
  end
end
