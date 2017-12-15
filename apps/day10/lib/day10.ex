defmodule Day10 do
  use Bitwise
  alias Utils.Hash
  @moduledoc "Day 10: Knot Hash"

  def part1(range, input) do
    input
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> Hash.tie(Enum.to_list(range))
    |> product_of_first_two
  end

  def part2(_range, input) do
    input
    |> Hash.knot_hash
  end

  defp product_of_first_two([x | [y | _]]), do: x * y
  defp product_of_first_two(_), do: 0
end
