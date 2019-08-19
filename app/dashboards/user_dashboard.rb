require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    posts: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    phone: Field::String,
    ssn: Field::Number,
    company: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :posts,
    :ssn,
    :email,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :posts,
    :ssn,
    :company,
    :email,
    :phone,
    :first_name,
    :last_name,
    :type,
  ].freeze

  FORM_ATTRIBUTES = [
    :ssn,
    :email,
    :first_name,
    :last_name,
    :encrypted_password,
    :phone,
  ].freeze

end
