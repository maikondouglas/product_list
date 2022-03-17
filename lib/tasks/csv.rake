# frozen_string_literal: true

require 'csv'

namespace :csv do
  desc 'Import the file CSV into the database'
  spinner = TTY::Spinner.new('[:spinner] Importing CSV file...', format: :dots)

  task import: :environment do
    spinner.auto_spin
    CSV.foreach('tmp/category.csv', headers: true) do |row|
      row.to_hash.each do |_key, value|
        Category::Category.create!(name: value)
      end
    end
    spinner.success('Done!')
  end
end
