class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role
  has_many :enrollments
  has_many :instructor_assignments
end
