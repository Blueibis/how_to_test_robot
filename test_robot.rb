require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.foreign_model = true
    # act
    result = robot.station
    # assert
    assert_equal(1, result)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    robot = Robot.new
    robot.vintage_model = true
    robot.needs_repairs = true
    # arrange
    result = robot.station
    # act
    assert_equal(2, result)
    # assert
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    skip
    # arrange

    # act

    # assert
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    skip
    # arrange

    # act

    # assert
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    skip
    # arrange

    # act

    # assert
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    skip
    # arrange

    # act

    # assert
  end

  def test_workday_on_day_off_returns_true
    skip
    # arrange

    # act

    # assert
  end

  def test_workday_not_day_off_returns_false
    skip
    # arrange

    # act

    # assert
  end

end
