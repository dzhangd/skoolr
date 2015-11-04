require 'csv'

class School < ActiveRecord::Base
	def self.import(file)
	::CSV.foreach(file.path, headers: true) do |row|
		School.create! row.to_hash
	end
end

  validates :name, presence: true
  validates :address, presence: true
end