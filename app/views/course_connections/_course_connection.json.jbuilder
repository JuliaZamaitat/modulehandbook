json.extract! course_connection, :id, :parent_course_code, :child_course_code, :required, :created_at, :updated_at
json.url course_connection_url(course_connection, format: :json)
