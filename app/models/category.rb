class Category < ApplicationRecord
  has_many :lectures

  validates :name, presence: true
end
