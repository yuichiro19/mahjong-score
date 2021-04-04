class RankBonus < ActiveHash::Base
  include ActiveHash::Associations
  has_many :games
  self.data = [
    { id: 1, name: 'なし', second_bonus: 0, third_bonus: 0, forth_bonus: 0 },
    { id: 2, name: '5-10', second_bonus: 5, third_bonus: -5, forth_bonus: -10 },
    { id: 3, name: '10-20', second_bonus: 10, third_bonus: -10, forth_bonus: -20 },
    { id: 4, name: '10-30', second_bonus: 10, third_bonus: -10, forth_bonus: -30 },
    { id: 5, name: '20-30', second_bonus: 20, third_bonus: -20, forth_bonus: -30 }
  ]
end
