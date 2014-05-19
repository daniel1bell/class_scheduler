class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :duration_weeks, :instructors_req
end
