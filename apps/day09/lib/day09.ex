defmodule Day09 do
  @moduledoc "Day 9: Stream Processing"

  def part1(input) do
    input
    |> remove_negated_chars
    |> remove_garbage
    |> String.graphemes
    |> Enum.reduce({0, 0}, &count_groups/2)
    |> elem(0)
  end

  def part2(input) do
    input
    |> remove_negated_chars
    |> count_garbage
  end

  defp remove_negated_chars(input) do
    input |> String.replace(~r/!./, "")
  end

  defp remove_garbage(input) do
    input |> String.replace(~r/<.*>/U, "")
  end

  defp count_groups("{", {count, depth}), do: {count, depth + 1}
  defp count_groups("}", {count, depth}), do: {count + depth, depth - 1}
  defp count_groups(_, acc), do: acc

  defp count_garbage(input) do
    ~r/<(.*)>/U
    |> Regex.scan(input)
    |> Enum.map(&tl/1)
    |> List.flatten
    |> Enum.map(&String.length/1)
    |> Enum.sum
  end

end
