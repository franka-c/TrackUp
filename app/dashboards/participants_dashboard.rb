class ParticipantDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    surname: Field::String,
    phone: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze
end