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
    prev = ring - 2
    side = ring - 1
    case number - prev * prev do
      0 -> 0
      x -> case rem(x, side) do
        r when r < div(side, 2) -> side - r
        r -> r
      end
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
    next_direction = next_direction(grid, coord, direction)
    next_coord = next_coord(coord, next_direction)
    neighbour_sum = neighbour_sum(grid, next_coord)
    {Map.put(grid, next_coord, neighbour_sum), next_coord, next_direction}
  end

  defp next_direction(grid, coord, direction) do
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

  defp neighbour_sum(grid, {x, y}) do
    (for  xd <- -1..1,
          yd <- -1..1,
          do: val(grid, {x + xd, y + yd}))
    |> Enum.sum
  end

  defp val(grid, coord) do
    Map.get(grid, coord, 0)
  end

end
