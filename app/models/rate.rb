class Rate < ActiveHash::Base
    include ActiveHash::Associations
    has_many :games
    self.data = [
        { id: 0, name: "ノーレート" },
        { id: 1, name: 1 },
        { id: 2, name: 3 },
        { id: 3, name: 5 },
        { id: 4, name: 10 },
        { id: 5, name: 20 },
        { id: 6, name: 30 }
    ]
end