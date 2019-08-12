class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.page(params[:page]).per(15)
      authorize @audit_logs
  end
  
  def confirm
    @audit_logs = AuditLog.find(params[:id])
    authorize @audit_logs
    @audit_logs.confirmado!
    redirect_to root_path, notice: "Confirmación registrada."
  end
end
