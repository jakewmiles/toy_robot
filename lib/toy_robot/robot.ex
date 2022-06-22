defmodule ToyRobot.Robot do
  @doc """
  Moves the robot east one space.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %{position: 0}
    %{position: 0}
    iex> robot |> Robot.move_east
    %{position: 1}
    iex> robot |> Robot.move_east |> Robot.move_east |> Robot.move_east
    %{position: 3}
  """
  def move_east(%{position: current_position}) do
    %{position: current_position + 1}
  end

  @doc """
  Moves the robot east one space.

  ## Examples

    iex> alias ToyRobot.Robot
    ToyRobot.Robot
    iex> robot = %{position: 0}
    %{position: 0}
    iex> robot |> Robot.move_west
    %{position: -1}
    iex> robot |> Robot.move_west |> Robot.move_west |> Robot.move_west
    %{position: -3}
  """
  def move_west(%{position: current_position}) do
    %{position: current_position - 1}
  end
end
