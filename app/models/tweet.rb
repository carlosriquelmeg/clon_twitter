class Tweet < ApplicationRecord
    validates :description, :username,presence: true

    include PgSearch::Model
    pg_search_scope :search_full_text, against: {
        description: 'A',
        username: 'B',
},
using: {
    tsearch: { 
        prefix: true,
        any_word: true,
        dictionary:'spanish'
    }
}
end
