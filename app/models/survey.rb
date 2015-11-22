class Survey < ActiveRecord::Base
  belongs_to :school
  validates :school_year, presence: true
  validates :question, presence: true
  validates :grade_group, presence: true
  validates :non_excluded_responses, presence: true
  validates :many_or_all_responses, presence: true
  validates :many_or_all_pct, presence: true
  validates :at_no_time_responses, presence: true
  validates :at_no_time_pct, presence: true
  validates :few_times_responses, presence: true
  validates :few_times_pct, presence: true
  validates :some_times_responses, presence: true
  validates :some_times_pct, presence: true
end