class BingoNumber < ApplicationRecord
  has_and_belongs_to_many :bingo_cards

  def display
    "#{self.letter.upcase}#{self.number}"
  end
end
