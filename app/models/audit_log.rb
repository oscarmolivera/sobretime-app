class AuditLog < ApplicationRecord
  enum status: {pendiente: 0, confirmado: 1}
  belongs_to :user
  
  after_initialize :set_default
  before_save :set_end_date if :confirmado?

  validates :user,  presence: true
  validates :status,  presence: true
  validates :start_date,  presence: true

  default_scope { order(id: :asc) }

  private 
    def set_default
      self.start_date ||= Date.today - 6.days
    end

    def set_end_date
      self.end_date = Date.today
    end
end
