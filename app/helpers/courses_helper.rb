module CoursesHelper
  def update_courses_link_path(user_id)
    s = '/users/' + user_id.to_s + '/courses/update_courses'
    return s
  end
end
