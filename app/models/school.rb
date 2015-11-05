class School < ActiveRecord::Base
  has_many :grades
  has_many :surveys
  validates :name, presence: true
  validates :address, presence: true

  def self.import(file)
    xls = Roo::Spreadsheet.open(file)
    xls.each(name: 'SCHOOL_NAME', address: 'ADDRESS') do |hash|
      if valid?(hash)
        School.create(name: hash[:name].split(' ')[0...-1].join(' '), address: hash[:address] + " Vancouver")
      end
    end
  end

  private
  def self.valid?(hash)
    return !School.exists?(name: hash[:name].split(' ')[0...-1].join(' ')) && hash[:name] != "SCHOOL_NAME" && hash[:name].split.last.delete('.') == "Sec"
  end
end