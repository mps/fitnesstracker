require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  test "invalid without a person" do
    e = exercises(:matthew)
    e.person = nil
    assert !e.valid?, 'A new exercise requires a person.'
  end

  test "invalid without a exercise_date" do
    e = exercises(:matthew)
    e.exercise_date = nil
    assert !e.valid?, 'A new exercise requires an exercise_date.'
  end
  
  test "invalid without minutes" do
    e = exercises(:matthew)
    e.minutes = nil
    assert !e.valid?, 'A new exercise requires minutes.'
  end

  test "valid with all attributes" do 
    e = exercises(:matthew)
    assert e.valid?, 'Exercise was not valid'
  end
end
