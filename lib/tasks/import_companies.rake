require 'csv'

task :import_companies => [:environment] do

    puts "Cleaning up existing data..."
    Company.destroy_all
    
    puts "Reading input and saving records (this could take a few minutes)..."
    csv_text = File.read(Rails.root.join('db', 'companylist.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

    csv.each do |row|
        c = Company.new
        c.symbol = row[0]
        c.name = row[1]
        c.save
        puts "#{c.symbol}, #{c.name} saved"
    end

end