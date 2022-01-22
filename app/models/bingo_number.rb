class BingoNumber < ApplicationRecord
  has_and_belongs_to_many :bingo_cards
  has_and_belongs_to_many :bingo_games

  def display
    "#{self.letter.upcase}#{self.number}"
  end
end
