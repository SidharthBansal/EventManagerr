module EventsHelper
  require "html_truncator"
  
  def resume(content)
    HTML_Truncator.truncate(content, 15)
  end

end
