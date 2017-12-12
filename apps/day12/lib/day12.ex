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
    |> find_all_groups_async
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

  defp find_all_groups_async(map) do
    map
    |> Map.keys
    |> Enum.map(
      fn key -> Task.async(
        fn -> find_group(map, [key]) end)
      end)
    |> Enum.map(fn worker -> Task.await(worker) end)
    |> Enum.map(&Enum.sort/1)
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
