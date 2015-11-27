class Rating < ActiveRecord::Base
  validates :value, presence: true
  belongs_to :school
end
