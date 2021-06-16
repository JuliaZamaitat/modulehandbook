class AddFrequencyToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :frequency, :text
  end
end
