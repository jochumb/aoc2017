defmodule Day03 do
  @moduledoc "Day 3: Spiral Memory"

  def part1(number) do
    number
    |> find_ring
    |> find_relative_location(number)
  end

  defp find_ring(number) do
    1
    |> Stream.iterate(&(&1 + 2))
    |> Enum.find(&(&1 * &1 >= number))
  end

  defp find_relative_location(ring, number) do
    case number - (ring - 2) * (ring - 2) do
      0 -> 0
      x -> rem(x, ring - 1)
    end
  end

  def part2(number) do
    spiral_upto(number, Map.put(Map.new(), {0, 0}, 1))
  end

  defp spiral_upto(number, grid, coord \\ {0, 0}, direction \\ nil) do
    {grid, current, direction} = find_next(grid, coord, direction)
    case Map.get(grid, current) do
      x when x > number -> x
      _ -> spiral_upto(number, grid, current, direction) # recurse
    end
  end

  defp find_next(grid, coord, direction) do
    next_direction = next_direction(coord, grid, direction)
    next_coord = next_coord(coord, next_direction)
    neighbour_sum = neighbour_sum(next_coord, grid)
    {Map.put(grid, next_coord, neighbour_sum), next_coord, next_direction}
  end

  defp next_direction(coord, grid, direction) do
    turned_dir = turn(direction)
    case val(grid, next_coord(coord, turned_dir)) do
      0 -> turned_dir
      _ -> direction
    end
  end

  defp turn(direction) do
    case direction do
      :north -> :west
      :east -> :north
      :south -> :east
      :west -> :south
      nil -> :east
    end
  end

  defp next_coord({x, y}, direction) do
    case direction do
      :north -> {x, y + 1}
      :east -> {x + 1, y}
      :south -> {x, y - 1}
      :west -> {x - 1, y}
    end
  end

  defp neighbour_sum({x, y}, grid) do
    val(grid, {x + 1, y}) +
      val(grid, {x + 1, y + 1}) +
      val(grid, {x , y + 1}) +
      val(grid, {x - 1, y + 1}) +
      val(grid, {x - 1, y}) +
      val(grid, {x - 1, y - 1}) +
      val(grid, {x, y - 1}) +
      val(grid, {x + 1, y - 1})
  end

  defp val(grid, coord) do
    Map.get(grid, coord, 0)
  end

end
