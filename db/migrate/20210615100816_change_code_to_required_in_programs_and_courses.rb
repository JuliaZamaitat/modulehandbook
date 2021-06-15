class ChangeCodeToRequiredInProgramsAndCourses < ActiveRecord::Migration[6.0]
  def change
    change_column :programs, :code, :text, null: false
    change_column :courses, :code, :text, null: false
  end
end
