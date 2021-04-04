class Score < ApplicationRecord
  belongs_to :user
  belongs_to :game

  with_options presence: true do
    validates :user_score
    validates :guest1_score
    validates :guest2_score
    validates :guest3_score
    validates :user_rank
    validates :guest1_rank
    validates :guest2_rank
    validates :guest3_rank
    validates :user_point
    validates :guest1_point
    validates :guest2_point
    validates :guest3_point
  end
end
