class Exercise < ActiveRecord::Base
  validates :person, :exercise_date, :minutes, presence: true
end
