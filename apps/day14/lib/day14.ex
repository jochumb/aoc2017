defmodule Day14 do
  alias Utils.Hash
  @moduledoc "Day 14: Disk Defragmentation"

  def part1(input) do
    input
    |> to_grid
    |> Enum.map(& Enum.count(&1, fn(x) -> x == 1 end))
    |> Enum.sum
  end

  def part2(input) do
    input
    |> to_grid
    |> group_rows
    |> num_groups
  end

  defp to_grid(input) do
    0..127
    |> Enum.map(fn n -> input <> "-#{n}" end)
    |> Enum.map(&Hash.knot_hash/1)
    |> Enum.map(& Integer.parse(&1, 16))
    |> Enum.map(& Integer.digits(elem(&1, 0), 2))
    |> Enum.map(
      fn l ->
        ([0] |> Stream.cycle |> Enum.take(128 - Enum.count(l))) ++ l
      end)
  end

  defp group_rows(grid) do
    grid
    |> Enum.reduce({[], 0}, &group_row/2)
    |> elem(0)
  end

  defp group_row(row, {acc, count}) do
    {grouped, new_count} = group_row(row, count, [])
    {[grouped|acc], new_count}
  end
  defp group_row([], count, grouped), do: {grouped, count}
  defp group_row([0|t], count, []), do: group_row(t, count, [0])
  defp group_row([0|t], count, l), do: group_row(t, count, [0|l])
  defp group_row([1|t], count, []), do: group_row(t, count + 1, [count + 1])
  defp group_row([1|t], count, [0|l]), do: group_row(t, count + 1, [count + 1, 0 | l])
  defp group_row([1|t], count, l), do: group_row(t, count, [count | l])

  defp num_groups(grouped_rows) do
    grouped_rows
    |> group_pairs
    |> Enum.uniq
    |> partision_into_connected_groups
    |> sum_groups(grouped_rows)
  end

  defp group_pairs(grid, row \\ 0, pairs \\ [])
  defp group_pairs(_, 128, pairs), do: pairs
  defp group_pairs(grid, row, pairs) do
    cur_row = Enum.at(grid, row)
    prev_row = if row == 0 do
      [0] |> Stream.cycle |> Enum.take(128)
    else
      grid |> Enum.at(row - 1)
    end

    row_pairs = cur_row
    |> Enum.zip(prev_row)
    |> Enum.filter(fn {a, b} -> a != 0 && b != 0 end)

    group_pairs(grid, row + 1, pairs ++ row_pairs)
  end

  defp partision_into_connected_groups(pairs, groups \\ %{})
  defp partision_into_connected_groups([], groups), do: groups
  defp partision_into_connected_groups([{a, b}|t], groups) do
    keys = groups |> Map.keys
    new_groups = case {a in keys, b in keys} do
      {true, true} ->
        update_same(Map.get(groups, a), Map.get(groups, b), groups)
      {true, false} ->
        Map.put(groups, b, Map.get(groups, a))
      {false, true} ->
        Map.put(groups, a, Map.get(groups, b))
      _ -> groups
        |> Map.put(a, a)
        |> Map.put(b, a)
    end
    partision_into_connected_groups(t, new_groups)
  end

  defp update_same(a, b, groups) when a == b, do: groups
  defp update_same(a, b, groups) do
    groups
    |> Map.to_list
    |> Enum.map(
      fn {k, v} ->
        if v == b do
          {k, a}
        else
          {k, v}
        end
      end)
    |> Enum.into(%{})
  end

  defp sum_groups(map, group_rows) do
    group_rows
    |> Enum.map(& row_keys(&1, map, []))
    |> List.flatten
    |> Enum.uniq
    |> Enum.count
  end

  defp row_keys([], _, acc), do: acc
  defp row_keys([0|t], map, acc), do: row_keys(t, map, acc)
  defp row_keys([h|t], map, acc) do
    row_keys(t, map, [Map.get(map, h, h)|acc])
  end

end
