require 'csv'
class Calllist < ApplicationRecord

def self.import(file)
csv_text = File.read(file.path)
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Calllist.create!(row.to_hash)
end

  #puts "firstblood:#{spreadsheet.to_json}"

end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then CSV.new(file.path)
  when ".xls" then Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end

end
