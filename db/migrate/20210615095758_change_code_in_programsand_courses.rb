class ChangeCodeInProgramsandCourses < ActiveRecord::Migration[6.0]
  def change
    add_index :programs, :code, unique: true
    add_index :courses, :code, unique: true
  end
end
