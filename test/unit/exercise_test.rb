require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  test "invalid without a person" do
    e = Exercise.new
    e.exercise_date = Date.today
    assert !e.valid?, 'A new exercise requires a person.'
  end

  test "invalid without a exercise_date" do
    e = Exercise.new
    e.person = 'Matthew'
    assert !e.valid?, 'A new exercise requires an exercise_date.'
  end

  test "valid with all attributes" do 
    e = Exercise.new
    e.person = 'Matthew'
    e.exercise_date = Date.today
    e.minutes = 20
    assert e.valid?, 'Exercise was not valid'
  end
end
