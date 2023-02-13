module ApplicationHelper
    def current?(key, path)
        "#{key}" if current_page?('/articles/' + path)
     end
end
