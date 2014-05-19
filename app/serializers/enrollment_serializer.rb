class EnrollmentSerializer < ActiveModel::Serializer
  attributes :id, :paid_amount, :prework_done
  has_one :cohort
end
