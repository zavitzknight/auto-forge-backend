class Car < ApplicationRecord
    belongs_to :user
    validates :make, :model, :color, :miles, :image, presence: true
    
    validates :make, length: { minimum:2 }
end
