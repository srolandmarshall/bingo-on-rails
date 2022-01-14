json.extract! bingo_card, :id, :winner, :number_id, :created_at, :updated_at
json.url bingo_card_url(bingo_card, format: :json)
