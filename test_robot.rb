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
		assert_equal 1, result

	end

	def test_that_vintage_robot_needing_repairs_sent_to_station_2
		# arrange
		robot =Robot.new
		robot.needs_repairs = true
		robot.vintage_model = true

		# act
		result = robot.station
		# assert
		assert_equal 2, result


	end

	def test_that_standard_robot_needing_repairs_sent_to_station_3
		# arrange
		robot = Robot.new
		robot.needs_repairs = true
		# act
		result = robot.station
		# assert
		assert_equal 3, result
	end

	def test_that_robot_in_good_condition_sent_to_station_4
		# arrange
		robot = Robot.new
		# act
		result= robot.station
		# assert
		assert_equal 4, result
	end

	def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
		robot= Robot.new
		# arrange
		result= robot.prioritize_tasks
		# act
		assert_equal -1, result
		# assert
	end

	def test_prioritize_tasks_with_todos_returns_max_todo_value
		robot= Robot.new
		robot.todos= [1]
		# arrange
		result= robot.prioritize_tasks
		# act
		assert_equal 1, result
		# assert
	end

	def test_workday_on_day_off_returns_false
			robot= Robot.new
			robot.day_off = "sunday"
		# arrange
			result = robot.workday?("sunday")
		# act
			assert_equal false, result
		# assert
	end

	def test_workday_not_day_off_returns_true
		robot = Robot.new
		robot.day_off="friday"
		# arrange
		result = robot.workday?("sunday")
		# act
		assert_equal true, result
		# assert
	end

end
