defmodule Day13 do
  @moduledoc "Day 13: Packet Scanners"

  def part1(input) do
    input
    |> to_int_tuple
    |> Enum.reduce(0, &next_scanner/2)
  end

  def part2(input) do
    input
    |> to_int_tuple
    |> Enum.into(%{})
    |> wait
  end

  defp to_int_tuple(input) do
    input
    |> Enum.map(& String.split(&1, ": "))
    |> Enum.map(fn [d, r] -> {String.to_integer(d), String.to_integer(r)} end)
  end

  defp next_scanner({depth, range}, acc) do
    case scanner_on_zero(depth, range) do
      true -> acc + depth * range
      false -> acc
    end
  end

  defp wait(map), do: wait_flow(map, Map.keys(map))
  defp wait_flow(map, depths) do
    0
    |> Stream.iterate(& &1 + 1)
    |> Flow.from_enumerable
    |> Flow.map(
      fn delay ->
        case find_first_caught(map, depths, delay) do
          nil -> delay
          _ -> nil
        end
      end)
    |> Flow.filter(&(&1 != nil))
    |> Enum.take(1)
    |> hd
  end

  defp find_first_caught(map, depths, delay) do
    depths
    |> Enum.find(
      fn depth ->
        %{^depth => range} = map
        scanner_on_zero(delay + depth, range)
      end)
  end

  defp scanner_on_zero(i, range) do
    rem(i, range * 2 - 2) == 0
  end
end
