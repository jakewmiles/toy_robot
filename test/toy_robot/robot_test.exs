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

  defp setup_test_robot(), do: %Robot{north: 0, east: 0, facing: :north}
end
