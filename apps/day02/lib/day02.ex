defmodule Day02 do
  @moduledoc "Day 2: Corruption Checksum"

  def part1(str_list) do
    str_list
    |> Enum.map(&Utils.List.convert_to_int_list/1)
    |> Enum.map(&(Enum.max(&1) - Enum.min(&1)))
    |> Enum.sum
  end

  def part2(str_list) do
    str_list
    |> Enum.map(&Utils.List.convert_to_int_list/1)
    |> Enum.map(&row_divisable/1)
    |> Enum.sum
  end

  defp row_divisable(row) do
    row
    |> Enum.sort(&(&1 >= &2))
    |> Utils.List.combinations(2)
    |> Enum.map(&List.to_tuple/1)
    |> Enum.filter(fn {x, y} -> rem(x, y) == 0 end)
    |> hd
    |> (fn {x, y} -> div(x, y) end).()
  end

end
