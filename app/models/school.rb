class School < ActiveRecord::Base
  require 'open-uri'

  has_many :grades, dependent: :destroy
  has_many :surveys, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true

  def self.import(file)
    xls = Roo::Spreadsheet.open(file, extension: :xls)
    xls.each(name: 'SCHOOL_NAME', address: 'ADDRESS') do |hash|
      if valid?(hash)
        School.create(name: hash[:name].split(' ')[0...-1].join(' '), address: hash[:address] + " Vancouver")
      end
    end
  end

  def self.fetch
    f = open("ftp://webftp.vancouver.ca/OpenData/xls/schools.xls")
    import(f)
  end
  
  def self.search(query)
	where('name LIKE ?', "%" + query + "%").all
  end

  private
  def self.valid?(hash)
    return !School.exists?(name: hash[:name].split(' ')[0...-1].join(' ')) && hash[:name] != "SCHOOL_NAME" && hash[:name].split.last.delete('.') == "Sec"
  end
end