defmodule Day03 do
  @moduledoc "Day 3: Spiral Memory"

  def part1(number) do                          # Example: 24 -> distance = 3
    number                                      # 
    |> find_ring                                #  17 16 15 14 13
    |> find_relative_location(number)           #  18  5  4  3 12
  end                                           #  19  6  1  2 11  
                                                #  20  7  8  9 10
  defp find_ring(number) do                     #  21 22 23 24 25
    1                                           #
    |> Stream.iterate(&(&1 + 2))                # [1, 3, 5, 7, ...]
    |> Enum.find(&(&1 * &1 >= number))          # 1*1 !>= 24 ... 5*5 >= 24 -> 5
  end                                           #
                                                #
  defp find_relative_location(ring, number) do  # Input: 5, 24
    prev = ring - 2                             # previous ring = 5 - 2 = 3
    side = ring - 1                             # one side of the ring = 5 - 1 = 4
    case number - prev * prev do                # decrease with inner numbers = 24 - 9 = 15
      0 -> 0                                    # zero case: 1-(-1)*(-1) = 0
      x -> case rem(x, side) do                 # remainder by side size = 15 % 4 = 3
        r when r < div(side, 2) -> side - r     # remainder lt 4/2=2 /< 
        r -> r                                  # -> 3
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
