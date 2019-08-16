class Post < ApplicationRecord
  enum status: {registrado: 0, aprobado: 1, rechazado: 2}
  belongs_to :user
  validates :date, presence: true
  validates :rationale, presence: true
  validates :overtime_request, presence: true
  validates :overtime_request, numericality: { greater_than: 0 }

  scope :posts_by, lambda{|user| where user_id: user.id}

  after_save :update_audit_log

  private
    def update_audit_log
      debugger
      audit_log = AuditLog.where(user_id: self.user.id, start_date: (self.date - 7.days..self.date)).last
      if audit_log.present?
        audit_log.status = 1
        audit_log.save
      end
    end
end
