class TopBonus < ActiveHash::Base
  include ActiveHash::Associations
  has_many :games
  self.data = [
    { id: 1, name: '3万点返し', basic: 30_000 },
    { id: 2, name: 'なし', basic: 25_000 }
  ]
end
