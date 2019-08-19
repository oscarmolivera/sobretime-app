class Post < ApplicationRecord
  enum status: {registrado: 0, aprobado: 1, rechazado: 2}
  belongs_to :user
  validates :date, presence: true
  validates :work_performed, presence: true
  validates :daily_hours, presence: true
  validates :daily_hours, numericality: { greater_than: 0 }

  scope :posts_by, lambda{|user| where user_id: user.id}

	after_save :confirm_audit_log, if: :registrado?
	after_save :un_confirm_audit_log, if: :rechazado?

  private
    def set_audit_log
      @audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
    end

    def confirm_audit_log
			set_audit_log
			@audit_log.confirmado! if @audit_log
		end

    def un_confirm_audit_log
			set_audit_log
			@audit_log.pendiente! if @audit_log
		end

end
