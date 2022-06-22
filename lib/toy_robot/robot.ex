defmodule ToyRobot.Robot do
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
  def move_east(%{east: curr_east}) do
    %{east: curr_east + 1}
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
  def move_west(%{east: curr_east}) do
    %{east: curr_east - 1}
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
  def move_north(%{north: curr_north}) do
    %{north: curr_north + 1}
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
  def move_south(%{north: curr_north}) do
    %{north: curr_north - 1}
  end
end
