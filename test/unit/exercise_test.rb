require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  def setup
    @e = exercises(:matthew)
  end

  def assert_presence(model, field)
    model.valid?
    assert_match /can't be blank/, model.errors[field].join,
          "Presence error for #{field} not found on #{model.class}"
  end

  test "invalid without a person" do
    @e.person = nil
    assert_presence(@e, :person)
  end

  test "invalid without a exercise_date" do
    @e.exercise_date = nil
    assert_presence(@e, :exercise_date)
  end
  
  test "invalid without minutes" do
    @e.minutes = nil
    assert_presence(@e, :minutes)
  end

  test "valid with all attributes" do 
    assert @e.valid?, 'Exercise was not valid'
  end
end
