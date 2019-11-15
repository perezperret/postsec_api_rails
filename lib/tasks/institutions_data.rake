require 'csv'

namespace :institutions_data do
  desc 'Creates sample data to test the application'
  task create: :environment do
    csv_text =
      File.read Rails.root.join('lib', 'tasks', 'institutions_data.csv')
    csv = CSV.new(csv_text, headers: true)

    csv.each do |institution_row|
      institution_data = institution_row.to_h
      Institution.create! \
        ipeds_id: institution_data['unitid'],
        name: institution_data['institution name']
    end
  end
end
