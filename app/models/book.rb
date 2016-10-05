class Book < ApplicationRecord
  # has_many :reviews, dependent: :destroy
  has_many :reviews,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy


  validates :name, length:
            { minimum: 3, too_short:
            "%{count} characters is too short" },
             uniqueness: true

  # def build_review(attributes = {}, user)
  #   review = reviews.build(attributes)
  #   review.user = user
  #   review
  # end

end
