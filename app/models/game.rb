class Game < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    belongs_to :rank_bonus
    belongs_to :rate
    belongs_to :top_bonus
    has_many :scores

    with_options presence: true do
        validates :guest1
        validates :guest2
        validates :guest3
        validates :rank_bonus_id
        validates :top_bonus_id
        validates :rate_id
        validates :chip
    end
end
