module DaysHelper
    def show_name(day)
        if day.name && day.name != ""
            s = ' - ' + day.name
            s.html_safe
        end
    end
end
