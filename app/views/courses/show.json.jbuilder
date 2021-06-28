json.merge! @course.attributes

json.course_connections do

  json.child_courses @child_courses
  json.parent_courses @parent_courses
end


