module ApplicationHelper

  def full_title(page_title)
    base_title = "HexGuru"
    if page_title.empty?
      base_title
    else
      "#{base_title} - #{page_title}"
    end
  end

  def flash_class(key)
    case key
    when :alert
      "alert-error"
    when :notice
      "alert-success"
    else
      ""
    end
  end
end
