class Rate < ActiveHash::Base
  include ActiveHash::Associations
  has_many :games
  self.data = [
    { id: 1, name: 'ノーレート', num: 0 },
    { id: 2, name: 1, num: 10 },
    { id: 3, name: 3, num: 30 },
    { id: 4, name: 5, num: 50 },
    { id: 5, name: 10, num: 100 },
    { id: 6, name: 20, num: 200 },
    { id: 7, name: 30, num: 300 }
  ]
end
