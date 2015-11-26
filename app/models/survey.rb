class Survey < ActiveRecord::Base
  belongs_to :school
  validates :many_or_all_responses, presence: true
  validates :at_no_time_responses, presence: true
  validates :few_times_responses, presence: true
  validates :some_times_responses, presence: true
end