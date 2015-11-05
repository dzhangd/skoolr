class School < ActiveRecord::Base
  has_many :grades
  has_many :surveys
  validates :name, presence: true
  validates :address, presence: true

  def self.import(file)
    xls = Roo::Spreadsheet.open(file)
    xls.each(name: 'SCHOOL_NAME', address: 'ADDRESS') do |hash|
      if valid?(hash)
        School.create(name: hash[:name], address: hash[:address])
      end
    end
  end

  private
  def self.valid?(hash)
  	return !School.exists?(name: hash[:name]) && hash[:name] != "SCHOOL_NAME"

  end
end