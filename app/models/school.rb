class School < ActiveRecord::Base
  has_many :grades
  has_many :surveys
  validates :name, presence: true
  validates :address, presence: true
end