class PersonPromotion < ApplicationRecord
  belongs_to :promotion
  belongs_to :person
end
