class AuditLog < ApplicationRecord
  belongs_to :user
  
  after_initialize :set_default

  validates :user,  presence: true
  validates :status,  presence: true
  validates :start_date,  presence: true

  private 
    def set_default
      self.start_date ||= Date.today - 6.days
    end
  
end