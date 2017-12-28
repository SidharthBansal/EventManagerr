module EventsHelper

  def resume(content)
    content.split()[0...15].join(" ") + "..."
  end
end
