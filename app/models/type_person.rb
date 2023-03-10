class TypePerson < ApplicationRecord
  has_many :people

  validates :name, presence: true
  validates :slug, presence: true
end
