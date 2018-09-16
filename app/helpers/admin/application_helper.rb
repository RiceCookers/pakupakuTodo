module Admin
  module ApplicationHelper
    def select_list_menu(path)
      return "active" if path == request.path_info
    end
  end
end