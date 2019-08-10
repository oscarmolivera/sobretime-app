class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_non_authorized

  def admin_types
    %w[ AdminUser]
  end

  private
    def user_non_authorized
      flash[:alert] = "No está autorizado para realizar esta acción."
      redirect_to(request.referrer || root_path)
    end
end
