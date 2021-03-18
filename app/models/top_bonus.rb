class TopBonus < ActiveHash::Base
    include ActiveHash::Associations
    has_many :games
    self.data = [
        { id: 1, name: "3万点返し", basic: 300 },
        { id: 2, name: "なし", basic: 250 }
    ] 