defmodule Day05 do
  @moduledoc "Day 5: A Maze of Twisty Trampolines, All Alike"

  def part1(input) do
    input
    |> to_indexed_int_map
    |> solve(Enum.count(input), fn val -> val + 1 end)
  end

  def part2(input) do
    input
    |> to_indexed_int_map
    |> solve(Enum.count(input),
      fn val -> if val >= 3 do val - 1 else val + 1 end end)
  end

  defp to_indexed_int_map(list) do
    list
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index
    |> Enum.map(fn {k, v} -> {v, k} end)
    |> Map.new
  end

  defp solve(_, _, _, _index \\ 0, _steps \\ 0)
  defp solve(_, max, _, index, steps) when index >= max, do: steps
  defp solve(map, max, func, index, steps) do
    %{^index => jump} = map
    %{map | index => func.(jump)}
    |> solve(max, func, index + jump, steps + 1)
  end

end
