defmodule Day06 do
  @moduledoc "Day 6: Memory Reallocation"
  import Enum
  import Map
  import String, only: [split: 1]

  def part1(input) do
    input |> solve |> elem(0)
  end

  def part2(input) do
    input |> solve |> elem(1) |> find_next
  end

  defp solve(input) do
    input
    |> to_indexed_int_map
    |> find_first_dupe
  end

  defp to_indexed_int_map(input) do
    input
    |> split
    |> map(&String.to_integer/1)
    |> with_index
    |> map(fn {k, v} -> {v, k} end)
    |> Map.new
  end

  defp find_first_dupe(map, seen \\ [], steps \\ 0) do
    i = map |> min_index
    new = map |> redistribute(i)
    if new in seen do
      {steps + 1, new}
    else
      find_first_dupe(new, [new | seen], steps + 1)
    end
  end

  defp find_next(state), do: find_next(state, state)
  defp find_next(map, state, steps \\ 0) do
    i = map |> min_index
    new = map |> redistribute(i)
    if new == state do
      steps + 1
    else
      find_next(new, state, steps + 1)
    end
  end

  defp min_index(map) do
    map
    |> Map.to_list
    |> filter(&(elem(&1, 1) == map |> values |> max))
    |> map(&(elem(&1, 0)))
    |> min
  end

  defp redistribute(map, index) do
    %{^index => value} = map
    %{map | index => 0}
    |> redistribute_to_0(index, value)
  end

  defp redistribute_to_0(map, _, 0), do: map
  defp redistribute_to_0(map, index, decr) do
    index = map |> next_index(index)
    %{^index => val} = map
    %{map | index => val + 1}
    |> redistribute_to_0(index, decr - 1)
  end

  defp next_index(map, index) do
    rem index + 1, map |> keys |> count
  end
end
