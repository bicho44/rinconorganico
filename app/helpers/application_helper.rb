module ApplicationHelper
  
  def current_page(page, action)
    return controller.controller_name.to_s == page && controller.action_name.to_s == action
  end

  def current_url_regex?(regexes)
    regexes = Array[regexes].flatten
    regexes.each {|regex| return true if request.fullpath =~ Regexp.new(regex)}
    false
  end
end
