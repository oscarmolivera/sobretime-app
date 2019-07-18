module PostsHelper
  def status_label status
    status_label_generator status
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
      end
    end
end
