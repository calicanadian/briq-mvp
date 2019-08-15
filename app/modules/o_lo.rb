module Olo
  def o_lo(message = "", decoration = "*")
    message = message.blank? ? "" : message
    d = decoration.blank? ? "*" : decoration
    3.times{ puts "" }
    3.times{ puts d * 20 }
    puts ""
    puts message
    puts ""
    3.times{ puts d * 20 }
    3.times{ puts "" }
  end
end

ActionController::Base.send(:include, Olo)
ActiveRecord::Base.send(:include, Olo)
ActionView::Base.send(:include, Olo)
