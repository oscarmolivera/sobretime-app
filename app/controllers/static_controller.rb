class StaticController < ApplicationController
  def homepage
    @pending_approval = Post.where(status: :registrado)
    @recent_audit_items = AuditLog.last(10)
  end
end