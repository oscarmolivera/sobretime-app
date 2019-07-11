require "administrate/base_dashboard"

class AdminUserDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    posts: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    password: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [ 
    :posts,
    :id,
    :email,
    :password,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :posts,
    :id,
    :email,
    :password,
    :first_name,
    :last_name,
    :type,
  ].freeze

  FORM_ATTRIBUTES = [
    :email,
    :password,
    :first_name,
    :last_name,
    :type,
  ].freeze

end
