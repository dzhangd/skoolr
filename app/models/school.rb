
class School < ActiveRecord::Base
	require 'csv'

	def self.import(file)
	CSV.foreach(file.path, headers: true) do |row|
		school_hash = row.to_hash
		schools = School.where(name: school_hash["name"])

		if schools.count == 1
			schools.first.update_attributes(school_hash)
			else
		School.create!(school_hash)
		end
	end
end

  validates :name, presence: true
  validates :address, presence: true
end