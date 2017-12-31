module EventsHelper
  require "html_truncator"
  
  def resume(content)
    HTML_Truncator.truncate(content, 20)
  end

end
