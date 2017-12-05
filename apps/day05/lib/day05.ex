defmodule Day05 do
  @moduledoc "Day 5: A Maze of Twisty Trampolines, All Alike"

  def part1(input) do
    input |> Enum.map(&String.to_integer/1) |> to_indexed_map |> solve1
  end

  defp solve1(map, index \\ 0, steps \\ 0) do
    if Map.has_key?(map, index) do
      jump = Map.get(map, index)
      map = Map.put(map, index, jump + 1)
      solve1(map, index + jump, steps + 1)
    else
      steps
    end
  end

  def part2(input) do
    input
    |> Enum.map(&String.to_integer/1)
    |> to_indexed_map
    |> solve2(Enum.count(input))
  end

  defp solve2(map, max, index \\ 0, steps \\ 0)
  defp solve2(_, max, index, steps) when index >= max, do: steps
  defp solve2(map, max, index, steps) do
    {jump, map} = Map.get_and_update!(map, index,
      fn val -> {
        val,
        if val >= 3 do val - 1 else val + 1 end
      } end)
    solve2(map, max, index + jump, steps + 1)
  end

  defp to_indexed_map(list) do
    list |> Enum.with_index |> Enum.map(fn {k, v} -> {v, k} end) |> Map.new
  end

end
