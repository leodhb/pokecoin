class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :pokemon

    OPERATIONS = {
        buy: {
            action: 'BUY'
        },
        sell: {
            action: 'SELL'
        }
    }.freeze
end
