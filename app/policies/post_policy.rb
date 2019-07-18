class PostPolicy < ApplicationPolicy
  def update?
    return true if post_aprobado? && admin?
    return true if user_or_admin? && !post_aprobado?
  end

  private 
    def user_or_admin?
      return true if record.user_id == user.id || admin?
    end

    def admin?
      admin_types.include?(user.type)
    end

    def post_aprobado?
      record.aprobado?
    end 
end