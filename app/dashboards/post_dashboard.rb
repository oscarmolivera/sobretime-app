require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    date: Field::DateTime.with_options(searchable: false),
    rationale: Field::Text.with_options(searchable: true),
    status: Field::Text.with_options(searchable: true),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :date,
    :rationale,
    :status,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :date,
    :rationale,
    :status,
    :created_at,
    :updated_at,
  ].freeze


  FORM_ATTRIBUTES = [
    :user,
    :date,
    :rationale,
  ].freeze

end
