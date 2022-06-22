defmodule ToyRobot.Robot do
  @keys [:north, :east, :facing]

  @enforce_keys @keys

  defstruct @keys

  alias ToyRobot.Robot

  @doc """
  Places a new robot at the given coordinate, facing in the given direction.

  ## Examples

  iex> alias ToyRobot.Robot
  ToyRobot.Robot
  iex> Robot.place(0, 1, :north)
  %Robot{north: 1, east: 0, facing: :north}
  """
  def place(x, y, direction) do
    %Robot{north: y, east: x, facing: direction}
  end

  @doc """
  Moves the robot one space in the direction it's facing.

  ## Examples

  iex> alias ToyRobot.Robot
  ToyRobot.Robot
  iex> robot = %Robot{north: 0, east: 0, facing: :north}
  %Robot{north: 0, east: 0, facing: :north}
  iex> robot |> Robot.move
  %Robot{north: 1, east: 0, facing: :north}
  iex> robot |> Robot.move |> Robot.move |> Robot.move
  %Robot{north: 3, east: 0, facing: :north}
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
  iex> robot = %Robot{facing: :north, east: 0, north: 0}
  %Robot{facing: :north, east: 0, north: 0}
  iex> robot |> Robot.left
  %Robot{facing: :west, east: 0, north: 0}
  iex> robot |> Robot.left |> Robot.left |> Robot.left
  %Robot{facing: :east, east: 0, north: 0}
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
  iex> robot = %Robot{facing: :north, east: 0, north: 0}
  %Robot{facing: :north, east: 0, north: 0}
  iex> robot |> Robot.right
  %Robot{facing: :east, east: 0, north: 0}
  iex> robot |> Robot.right |> Robot.right |> Robot.right
  %Robot{facing: :west, east: 0, north: 0}
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
