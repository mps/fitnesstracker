class Exercise < ActiveRecord::Base
  #named_scope :date_search, lambda { |*args| {:conditions => ["exercise_date between ? AND ?", args.first, args.second] } }
end
