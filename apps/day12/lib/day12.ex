defmodule Day12 do
  @moduledoc "Day 12: Digital Plumber"

  def part1(input) do
    input
    |> parse_to_map
    |> find_group([:"0"])
    |> Enum.count
  end

  def part2(input) do
    input
    |> parse_to_map
    |> find_all_group
    |> Enum.uniq
    |> Enum.count
  end

  defp find_group(map, progs, acc \\ [])
  defp find_group(_, [], acc), do: acc
  defp find_group(map, [h|t], acc) do
    new_acc = [h|acc] |> Enum.uniq
    list = t ++ Map.get(map, h) -- new_acc |> Enum.uniq
    find_group(map, list, new_acc)
  end

  defp find_all_group(map, keys \\ nil, acc \\ [])
  defp find_all_group(_, [], acc), do: acc
  defp find_all_group(map, nil, acc), do: find_all_group(map, Map.keys(map), acc)
  defp find_all_group(map, [h|t], acc) do
    new_acc = [(map |> find_group([h]) |> Enum.sort)|acc]
    find_all_group(map, t, new_acc)
  end

  defp parse_to_map(input) do
    input
    |> Enum.map(fn str -> String.split(str, " <-> ") end)
    |> Enum.map(
      fn [key, val] ->
        {String.to_atom(key),
        val |> String.split(", ") |> Enum.map(&String.to_atom/1)}
      end)
    |> Enum.into(%{})
  end

end
