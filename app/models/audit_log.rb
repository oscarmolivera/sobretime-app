class AuditLog < ApplicationRecord
  enum status: {pendiente: 0, confirmado: 1}
  belongs_to :user
  
  after_initialize :set_default
  before_save :set_end_date

  validates :user,  presence: true
  validates :status,  presence: true
  validates :start_date,  presence: true

  default_scope { order(id: :asc) }
  scope :by_start_date, lambda{order('start_date DESC')}

  private 
    def set_default
      self.start_date ||= Date.today - 6.days
    end

    def set_end_date      
      self.end_date = Date.today if self.confirmado?
    end
end
