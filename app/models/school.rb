class School < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true

  def self.import(file)
    xls = Roo::Spreadsheet.open(file)
    xls.sheet.each(name: 'School Name', address: 'Address') do |hash|
      School.create! hash
    end
  end

end