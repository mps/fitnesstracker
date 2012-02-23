class Exercise < ActiveRecord::Base
  validates :person, :exercise_date, presence: true
end
