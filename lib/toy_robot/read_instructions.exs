alias ToyRobot.Robot

{:ok, file} = System.argv() |> File.read()

[initial_placement | rest] = String.split(file, "\n")

[_command | coords] = String.split(initial_placement, " ")

[x, y, direction] = String.split(hd(coords), ",")

atom_direction =
  direction
  |> String.downcase()
  |> String.to_atom()

initial_robot = Robot.place(String.to_integer(x), String.to_integer(y), atom_direction)

Enum.reduce(rest, initial_robot, fn instruction, robot ->
  [split] = String.split(instruction, " ")

  case split do
    "MOVE" ->
      IO.puts("The robot moves forward...")

      Robot.move(robot)
      |> IO.inspect()

    "RIGHT" ->
      IO.puts("The robot rotates right...")

      Robot.rotate(robot, :right)
      |> IO.inspect()

    "LEFT" ->
      IO.puts("The robot rotates left...")

      Robot.rotate(robot, :right)
      |> IO.inspect()
  end
end)
