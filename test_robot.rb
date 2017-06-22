require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.foreign_model = true
    robot.vintage_model = false
    # act
    result = robot.station
    # assert
    assert_equal(1, result)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    robot = Robot.new
    robot.vintage_model = true
    robot.needs_repairs = true
    robot.foreign_model = false
    # act
    result = robot.station
    # assert
    assert_equal(2, result)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.vintage_model = false
    robot.foreign_model = false
    # act
    result = robot.station
    # assert
    assert_equal(3, result)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    robot = Robot.new
    robot.vintage_model = false
    robot.foreign_model = false
    robot.needs_repairs = false
    # arrange
    result = robot.station
    # act
    assert_equal(4, result)
    # assert
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    robot = Robot.new
    # act
    result = robot.prioritize_tasks
    # assert
    assert_equal(-1, result)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot = Robot.new
    robot.todos << 5
    robot.todos << 123
    # act
    result = robot.prioritize_tasks
    # assert
    assert_equal(123, result)
  end

  def test_workday_on_day_off_returns_true
    # arrange
    robot = Robot.new
    robot.day_off = "Sunday"
    # act
    result = robot.workday?("Monday")
    # assert
    assert_equal(true, result)
  end

  def test_workday_not_day_off_returns_false
    # arrange
    robot = Robot.new
    robot.day_off = "Sunday"
    # act
    result = robot.workday?("Sunday")
    # assert
    assert_equal(false, result)
  end

end
