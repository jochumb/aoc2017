defmodule Day06 do
  @moduledoc "Day 6: Memory Reallocation"

  def part1(input) do
    {count, _} = input
    |> to_indexed_int_map
    |> solve
    count
  end

  def part2(input) do
    {_, state} = input
    |> to_indexed_int_map
    |> solve
    state |> find_next(state)
  end

  defp to_indexed_int_map(input) do
    input
    |> String.split
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index
    |> Enum.map(fn {k, v} -> {v, k} end)
    |> Map.new
  end

  defp solve(map, seen \\ [], steps \\ 0) do
    i = map |> min_index
    new = map |> redistribute(i)
    if new in seen do
      {steps + 1, new}
    else
      solve(new, [new | seen], steps + 1)
    end
  end

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
    {index, _} = map
    |> Map.keys
    |> Enum.reduce({0, 0}, &(min_value(map, &1, &2)))
    index
  end

  defp min_value(map, 0, _), do: {0, map[0]}
  defp min_value(map, index, {_, val} = acc) do
    case map[index] do
      c when c > val -> {index, c}
      _ -> acc
    end
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
    size = map |> Map.keys |> Enum.count
    case index + 1 do
      next when next < size -> next
      _ -> 0
    end
  end
end
