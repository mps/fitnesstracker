require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  def setup
    @e = exercises(:matthew)
  end

  should validate_presence_of(:person)
  should validate_presence_of(:exercise_date)
  should validate_presence_of(:minutes)

  test "valid with all attributes" do 
    assert @e.valid?, 'Exercise was not valid'
  end
end
