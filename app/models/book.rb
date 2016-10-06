class Book < ApplicationRecord
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

  def self.search(search)
    where("name ILIKE ? OR author ILIKE ? OR cast(year as text) ILIKE ? OR genre ILIKE ?", "%#{search}", "%#{search}", "%#{search}", "%#{search}" )
  end

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end

end
