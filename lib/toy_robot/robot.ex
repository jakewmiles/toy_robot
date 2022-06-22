defmodule ToyRobot.Robot do
  @keys [:north, :east, :facing]

  @enforce_keys @keys

  defstruct @keys

  @type t :: %__MODULE__{north: coord(), east: coord(), facing: direction()}

  @type coord :: 0 | 1 | 2 | 3 | 4 | 5
  @type direction :: :north | :east | :south | :west

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
    %Robot{
      north: validate_coord(y),
      east: validate_coord(x),
      facing: direction
    }
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
    %{robot | east: validate_coord(curr_east + 1)}
  end

  defp move_west(%Robot{east: curr_east} = robot) do
    %{robot | east: validate_coord(curr_east - 1)}
  end

  defp move_north(%Robot{north: curr_north} = robot) do
    %{robot | north: validate_coord(curr_north + 1)}
  end

  defp move_south(%Robot{north: curr_north} = robot) do
    %{robot | north: validate_coord(curr_north - 1)}
  end

  defp validate_coord(coord) do
    with true <-
           is_integer(coord),
         true <-
           within_table_range?(coord) do
      coord
    else
      {:error, :above_range} -> 5
      {:error, :below_range} -> 0
    end
  end

  defp within_table_range?(coord) do
    cond do
      coord > 5 -> {:error, :above_range}
      coord < 0 -> {:error, :below_range}
      true -> true
    end
  end
end
