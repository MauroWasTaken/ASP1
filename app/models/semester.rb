class Semester < ApplicationRecord
  has_many :grades

  validates :name, presence: true
end
