class BingoNumber < ApplicationRecord
  has_many :bingo_cards

  def name
    "#{letter.capitalize}#{number}"
  end
end
