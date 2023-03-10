class PersonPromotion < ApplicationRecord
  belongs_to :person
  belongs_to :promotion

  validates :promotion_id, presence: true
  validates :person_id, presence: true
end
