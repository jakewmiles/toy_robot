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
  Moves the robot east one space.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{east: 0}
    %Robot{east: 0}
    iex> robot |> Robot.move_east
    %Robot{east: 1}
    iex> robot |> Robot.move_east |> Robot.move_east |> Robot.move_east
    %Robot{east: 3}
  """
  def move_east(%Robot{east: curr_east} = robot) do
    %{robot | east: curr_east + 1}
  end

  @doc """
  Moves the robot west one space.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{east: 0}
    %Robot{east: 0}
    iex> robot |> Robot.move_west
    %Robot{east: -1}
    iex> robot |> Robot.move_west |> Robot.move_west |> Robot.move_west
    %Robot{east: -3}
  """
  def move_west(%Robot{east: curr_east} = robot) do
    %{robot | east: curr_east - 1}
  end

  @doc """
  Moves the robot north one space.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{north: 0}
    %Robot{north: 0}
    iex> robot |> Robot.move_north
    %Robot{north: 1}
    iex> robot |> Robot.move_north |> Robot.move_north |> Robot.move_north
    %Robot{north: 3}
  """
  def move_north(%Robot{north: curr_north} = robot) do
    %{robot | north: curr_north + 1}
  end

  @doc """
  Moves the robot south one space.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %Robot{north: 0}
    %Robot{north: 0}
    iex> robot |> Robot.move_south
    %Robot{north: -1}
    iex> robot |> Robot.move_south |> Robot.move_south |> Robot.move_south
    %Robot{north: -3}
  """
  def move_south(%Robot{north: curr_north} = robot) do
    %{robot | north: curr_north - 1}
  end
end
