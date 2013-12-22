module ApplicationHelper
  def active_controller(name)
    "active" if controller_name == name
  end
end
