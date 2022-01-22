class BingoCard < ApplicationRecord
  has_and_belongs_to_many :bingo_numbers
  has_and_belongs_to_many :bingo_games

  def initialize(params = {})
    super()
    
    if params[:bingo_game_id]
      @bingo_game = BingoGame.find(params[:bingo_game_id])  
      bingo_games << @bingo_game
    end
  end

  def pick_numbers
    %w(b i n g o).each do |letter|
      BingoNumber.where(letter: letter).sample(5).sort_by(&:number).each do |number|
        number.bingo_cards << self
      end
    end
  end

  def board_array
    arr = [[], [], [], [], []]
    %w(b i n g o).each do |letter|
      index = 0
      bingo_numbers.where(letter: letter).each do |number|
        arr[index] << number
        index += 1
      end
    end
    arr
  end

  def board_array_json
    { "board": board_array }
  end
end
