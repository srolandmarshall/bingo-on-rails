class BingoGame < ApplicationRecord
  has_and_belongs_to_many :bingo_cards
  has_and_belongs_to_many :bingo_numbers

  def draw_number
    return nil unless possible_numbers.any?

    bingo_number = possible_numbers.sample
    bingo_numbers << bingo_number
    save!
    bingo_number
  end

  def possible_numbers
    @possible_numbers ||= BingoNumber.all - bingo_numbers
  end

  def reset_numbers
    bingo_numbers.destroy_all
  end

end
