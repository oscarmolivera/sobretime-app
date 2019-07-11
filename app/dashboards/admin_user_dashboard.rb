require "administrate/base_dashboard"

class AdminUserDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    posts: Field::HasMany.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    email: Field::String.with_options(searchable: true),
    encrypted_password: Field::String.with_options(searchable: false),
    first_name: Field::String.with_options(searchable: false),
    last_name: Field::String.with_options(searchable: false),
    type: Field::String.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = [ 
    :posts,
    :id,
    :email,
    :encrypted_password,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :posts,
    :id,
    :email,
    :first_name,
    :last_name,
    :type,
  ].freeze

  FORM_ATTRIBUTES = [
    :email,
    :encrypted_password,
    :first_name,
    :last_name,
    :type,
  ].freeze

end