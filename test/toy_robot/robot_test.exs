defmodule ToyRobot.RobotTest do
  use ExUnit.Case
  alias ToyRobot.Robot

  describe "place/3" do
    test "places a robot at a given coordinate, in a given direction" do
      robot = setup_test_robot()

      assert robot.north == 0
      assert robot.east == 0
      assert robot.facing == :north
    end

    test "raises when an invalid direction is read" do
      assert_raise RuntimeError, fn -> Robot.place(0, 0, :invalid) end
    end
  end

  describe "move/1" do
    test "moves a robot forward 1 space in a given direction" do
      robot = setup_test_robot()

      post_move_robot = Robot.move(robot)

      assert post_move_robot.north == 1
      assert post_move_robot.east == 0
      assert post_move_robot.facing == :north
    end

    test "multiple moves can be chained together" do
      robot = setup_test_robot()

      post_move_robot =
        robot
        |> Robot.move()
        |> Robot.move()
        |> Robot.move()
        |> Robot.move()
        |> Robot.move()

      assert post_move_robot.north == 5
      assert post_move_robot.east == 0
      assert post_move_robot.facing == :north
    end

    test "robot can't move beyond the end of the board" do
      robot = setup_test_robot()

      post_move_robot =
        robot
        |> Robot.move()
        |> Robot.move()
        |> Robot.move()
        |> Robot.move()
        |> Robot.move()

      assert post_move_robot.north == 5

      end_of_board_robot = Robot.move(post_move_robot)

      assert end_of_board_robot.north == 5
    end
  end

  describe "rotate/2" do
    test "rotates a robot 90 degrees clockwise" do
      robot = setup_test_robot()

      rotated_right_robot = Robot.rotate(robot, :right)

      assert rotated_right_robot.facing == :east
    end

    test "rotations can be chained" do
      robot = setup_test_robot()

      rotated_right_robot =
        robot
        |> Robot.rotate(:right)
        |> Robot.rotate(:right)
        |> Robot.rotate(:left)

      assert rotated_right_robot.facing == :east
    end
  end

  describe "report/1" do
    test "returns a string update of the robot's status" do
      robot = setup_test_robot()

      assert Robot.report(robot) == "The robot is currently facing north and is located at (0, 0)"
    end
  end

  defp setup_test_robot(), do: %Robot{north: 0, east: 0, facing: :north}
end
