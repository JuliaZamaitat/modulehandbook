json.extract! course, :id, :name, :code, :mission, :ects, :examination, :objectives, :contents, :prerequisites, :literature, :methods, :skills_knowledge_understanding, :skills_intellectual, :skills_practical, :skills_general, :created_at, :updated_at, :responsible_person, :frequency
json.url course_url(course, format: :json)
