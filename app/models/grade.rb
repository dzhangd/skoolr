class Grade < ActiveRecord::Base
  belongs_to :school
  validates :subject, presence: true
  validates :grade, presence: true
  validates :average_mark, presence: true
end