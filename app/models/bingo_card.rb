class BingoCard < ApplicationRecord
  has_and_belongs_to_many :bingo_numbers
  
  def pick_numbers
    %w(b i n g o).each do |letter|
      BingoNumber.where(letter: letter).sample(5).each do |number|
        number.bingo_cards << self
      end
    end
    self.save!
  end

  def board_array
    arr = [[], [], [], [], []]
    %w(b i n g o).each do |letter|
      index = 0
      bingo_numbers.where(letter: letter).each do |number|
        arr[index] << number.number
        index += 1
      end
    end
    arr
  end

end
