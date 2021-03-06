module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
  end
  
  def status_label status
    status_label_generator status
  end

  def admin_types
    %w[ AdminUser ]
  end

  def employee?
    true if current_user.type == 'Employee'
  end

  def admin?
    true if admin_types.include?(current_user.type)
  end

  private
    def status_label_generator status
      case status
      when 'registrado'
        content_tag(:span, status.titleize, class: 'label label-primary')
      when 'aprobado'
        content_tag(:span, status.titleize, class: 'label label-success')
      when 'rechazado'
        content_tag(:span, status.titleize, class: 'label label-danger')
      when 'pendiente'
        content_tag(:span, status.titleize, class: 'label label-primary')
      when 'confirmado'
        content_tag(:span, status.titleize, class: 'label label-success')  
      end
    end 
end
