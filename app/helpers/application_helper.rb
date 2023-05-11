module ApplicationHelper
  def format_date_time(value)
    return unless value.present?

    value.strftime('%d %b, %Y %I:%M %p')
  end

  def active?(controller_name)
    'active' if params[:controller] == controller_name
  end
end
