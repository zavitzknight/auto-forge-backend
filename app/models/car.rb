class Car < ApplicationRecord
    belongs_to :user

    validates :make, :model, :color, :miles, :image, :cost, :description, :year, :user_id, presence: true
    validates :make, length: { minimum:2 }
end
