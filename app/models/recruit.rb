class Recruit < ApplicationRecord
  belongs_to :user
  validates :recruit, presence: true, length: { minimum: 10, maximum: 300 }
end
