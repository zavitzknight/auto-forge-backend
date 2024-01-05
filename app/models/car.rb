class Car < ApplicationRecord
    belongs_to :user
    validates :make, presence: true
end
