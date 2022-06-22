defmodule ToyRobot.Robot do
  @doc """
  Moves the robot one space in the direction it's facing.

  ## Examples

  iex> alias ToyRobot.Robot
  ToyRobot.Robot
  iex> robot = %{north: 0, facing: :north}
  %{north: 0, facing: :north}
  iex> robot |> Robot.move
  %{north: 1, facing: :north}
  iex> robot |> Robot.move |> Robot.move |> Robot.move
  %{north: 3, facing: :north}
  """
  def move(%{facing: curr_facing} = robot) do
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
    iex> robot = %{east: 0}
    %{east: 0}
    iex> robot |> Robot.move_east
    %{east: 1}
    iex> robot |> Robot.move_east |> Robot.move_east |> Robot.move_east
    %{east: 3}
  """
  def move_east(%{east: curr_east} = robot) do
    %{robot | east: curr_east + 1}
  end

  @doc """
  Moves the robot west one space.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %{east: 0}
    %{east: 0}
    iex> robot |> Robot.move_west
    %{east: -1}
    iex> robot |> Robot.move_west |> Robot.move_west |> Robot.move_west
    %{east: -3}
  """
  def move_west(%{east: curr_east} = robot) do
    %{robot | east: curr_east - 1}
  end

  @doc """
  Moves the robot north one space.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %{north: 0}
    %{north: 0}
    iex> robot |> Robot.move_north
    %{north: 1}
    iex> robot |> Robot.move_north |> Robot.move_north |> Robot.move_north
    %{north: 3}
  """
  def move_north(%{north: curr_north} = robot) do
    %{robot | north: curr_north + 1}
  end

  @doc """
  Moves the robot south one space.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %{north: 0}
    %{north: 0}
    iex> robot |> Robot.move_south
    %{north: -1}
    iex> robot |> Robot.move_south |> Robot.move_south |> Robot.move_south
    %{north: -3}
  """
  def move_south(%{north: curr_north} = robot) do
    %{robot | north: curr_north - 1}
  end
end
