defmodule Day11 do
  require Integer
  @moduledoc "Day 11: Hex Ed"

  def part1(input) do
    input
    |> String.trim_trailing
    |> String.split(",")
    |> Enum.reduce({0, 0}, &consume_step/2)
    |> to_distance
  end

  def part2(input) do
    input
    |> String.trim_trailing
    |> String.split(",")
    |> max_distance
  end

  defp max_distance(list, acc \\ {0, 0}, max \\ 0)
  defp max_distance([], _, max), do: max
  defp max_distance([h|t], acc, max) do
    new_acc = consume_step(h, acc)
    new_max = Enum.max([to_distance(new_acc), max])
    max_distance(t, new_acc, new_max)
  end

  defp consume_step("n", {x, y}), do: {x, y + 2}
  defp consume_step("ne", {x, y}), do: {x + 1, y + 1}
  defp consume_step("nw", {x, y}), do: {x - 1, y + 1}
  defp consume_step("s", {x, y}), do: {x, y - 2}
  defp consume_step("se", {x, y}), do: {x + 1, y - 1}
  defp consume_step("sw", {x, y}), do: {x - 1, y - 1}
  defp consume_step(_, acc), do: acc

  defp to_distance({x, y}) do
    x = abs(x)
    y = abs(y)
    case y - x do
      d when d <= 0 -> x
      d -> x + div(d, 2)
    end
  end

end
