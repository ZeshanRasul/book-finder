class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, length: { minimum: 3, too_short: "%{count} characters is too short" }, uniqueness: true
end
