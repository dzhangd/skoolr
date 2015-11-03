class School < ActiveRecord::Base
  has_many :grades
  validates :name, presence: true
  validates :address, presence: true
end