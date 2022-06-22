defmodule ToyRobot.Robot do
  defstruct [:north, :east, :facing]

  alias ToyRobot.Robot

  @doc """
  Moves the robot one space in the direction it's facing.

  ## Examples

  iex> alias ToyRobot.Robot
  ToyRobot.Robot
  iex> robot = %Robot{north: 0, facing: :north}
  %Robot{north: 0, facing: :north}
  iex> robot |> Robot.move
  %Robot{north: 1, facing: :north}
  iex> robot |> Robot.move |> Robot.move |> Robot.move
  %Robot{north: 3, facing: :north}
  """
  def move(%Robot{facing: curr_facing} = robot) do
    case curr_facing do
      :north -> move_north(robot)
      :south -> move_south(robot)
      :east -> move_east(robot)
      :west -> move_west(robot)
    end
  end

  @doc """
  Moves the robot one space in the direction it's facing.

  ## Examples

  iex> alias ToyRobot.Robot
  ToyRobot.Robot
  iex> robot = %Robot{facing: :north}
  %Robot{facing: :north}
  iex> robot |> Robot.left
  %Robot{facing: :west}
  iex> robot |> Robot.left |> Robot.left |> Robot.left
  %Robot{facing: :east}
  """
  def left(%Robot{facing: curr_facing} = robot) do
    case curr_facing do
      :north -> %{robot | facing: :west}
      :east -> %{robot | facing: :north}
      :south -> %{robot | facing: :east}
      :west -> %{robot | facing: :south}
    end
  end

  @doc """
  Moves the robot one space in the direction it's facing.

  ## Examples

  iex> alias ToyRobot.Robot
  ToyRobot.Robot
  iex> robot = %Robot{facing: :north}
  %Robot{facing: :north}
  iex> robot |> Robot.right
  %Robot{facing: :east}
  iex> robot |> Robot.right |> Robot.right |> Robot.right
  %Robot{facing: :west}
  """
  def right(%Robot{facing: curr_facing} = robot) do
    case curr_facing do
      :north -> %{robot | facing: :east}
      :east -> %{robot | facing: :south}
      :south -> %{robot | facing: :west}
      :west -> %{robot | facing: :north}
    end
  end

  defp move_east(%Robot{east: curr_east} = robot) do
    %{robot | east: curr_east + 1}
  end

  defp move_west(%Robot{east: curr_east} = robot) do
    %{robot | east: curr_east - 1}
  end

  defp move_north(%Robot{north: curr_north} = robot) do
    %{robot | north: curr_north + 1}
  end

  defp move_south(%Robot{north: curr_north} = robot) do
    %{robot | north: curr_north - 1}
  end
end
