defmodule Day14 do
  alias Utils.Hash
  @moduledoc "Day 14: Disk Defragmentation"

  def part1(input) do
    0..127
    |> Enum.map(fn n -> input <> "-" <> Integer.to_string(n) end)
    |> Enum.map(&Hash.knot_hash/1)
    |> Enum.map(& Integer.parse(&1, 16))
    |> Enum.map(& Integer.digits(elem(&1, 0), 2))
    |> Enum.map(& Enum.count(&1, fn(x) -> x == 1 end))
    |> Enum.sum
  end

end
