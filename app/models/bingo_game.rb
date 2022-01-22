class BingoGame < ApplicationRecord
  has_and_belongs_to_many :bingo_cards
  has_and_belongs_to_many :bingo_numbers
end
