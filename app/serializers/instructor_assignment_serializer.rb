class InstructorAssignmentSerializer < ActiveModel::Serializer
  attributes :id
  has_one :cohort
end
