defmodule ToyRobot.Robot do
  @keys [:north, :east, :facing]

  @enforce_keys @keys

  defstruct @keys

  @type t :: %__MODULE__{north: coord(), east: coord(), facing: direction()}

  @type coord :: 0 | 1 | 2 | 3 | 4 | 5
  @type direction :: :north | :east | :south | :west

  alias ToyRobot.Robot

  def place(x, y, direction) do
    %Robot{
      north: validate_coord(y),
      east: validate_coord(x),
      facing: validate_direction(direction)
    }
  end

  def move(%Robot{facing: curr_facing} = robot) do
    case curr_facing do
      :north -> move_north(robot)
      :south -> move_south(robot)
      :east -> move_east(robot)
      :west -> move_west(robot)
    end
  end

  def left(%Robot{facing: curr_facing} = robot) do
    case curr_facing do
      :north -> %{robot | facing: :west}
      :east -> %{robot | facing: :north}
      :south -> %{robot | facing: :east}
      :west -> %{robot | facing: :south}
    end
  end

  def right(%Robot{facing: curr_facing} = robot) do
    case curr_facing do
      :north -> %{robot | facing: :east}
      :east -> %{robot | facing: :south}
      :south -> %{robot | facing: :west}
      :west -> %{robot | facing: :north}
    end
  end

  defguard is_valid_direction(direction)
           when is_atom(direction) and direction in [:north, :east, :south, :west]

  defp validate_direction(direction) when is_valid_direction(direction), do: direction

  defp validate_direction(_direction),
    do: raise("Invalid direction, must be one of :north, :east, :south or :west")

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
