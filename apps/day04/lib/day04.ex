defmodule Day04 do
  @moduledoc "Day 4: High-Entropy Passphrases"
  import Enum
  import String, only: [split: 1]
  def part1(i), do: i |> solve(&v1?/1)
  def v1?(s), do: s |> split |> no_dup
  def part2(i), do: i |> solve(&v2?/1)
  def v2?(s), do: s |> split |> map(&ord/1) |> no_dup
  defp solve(l, f), do: l |> filter(f) |> count
  defp ord(s), do: s |> to_charlist |> sort
  defp no_dup(l), do: l |> count == l |> uniq |> count
end
