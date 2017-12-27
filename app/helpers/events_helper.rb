module EventsHelper

  def resume(content)
    content.split()[0...10].join(" ") + "..."
  end
end
