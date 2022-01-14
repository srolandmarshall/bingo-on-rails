json.extract! bingo_number, :id, :bingo_card_id, :letter, :number, :created_at, :updated_at
json.url bingo_number_url(bingo_number, format: :json)
