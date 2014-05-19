class CohortSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date
  has_one :course
end
