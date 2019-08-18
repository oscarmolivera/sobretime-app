class StaticController < ApplicationController
  
  def homepage
    if current_user.present?
      if admin_types.include?(current_user.type)
        @pending_approval = Post.registrado
        @recent_audit_items = AuditLog.last(10)
      else
        @pending_audit_confirmations = current_user.audit_logs.pendiente.by_start_date
      end    
    end  
  end

end
