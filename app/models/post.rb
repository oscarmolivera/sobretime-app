class Post < ApplicationRecord
  enum status: {registrado: 0, aprobado: 1, rechazado: 2}
  belongs_to :user
  validates :date, presence: true
  validates :rationale, presence: true

  scope :posts_by, lambda{|user| where user_id: user.id}
end
