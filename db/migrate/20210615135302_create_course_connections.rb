class CreateCourseConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :course_connections do |t|
      t.text :parent_course_code
      t.text :child_course_code
      t.text :required

      t.timestamps
    end
  end
end
