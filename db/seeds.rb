# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

bingo_numbers = {
  b: [*1..15],
  i: [*16..30],
  n: [*31..45],
  g: [*46..60],
  o: [*61..75]
}

bingo_numbers.each do |letter, numbers|
  numbers.each do |number|
    BingoNumber.create!(letter: letter.to_s, number: number.to_i)
  end
end