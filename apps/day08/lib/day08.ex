defmodule Day08 do
  @moduledoc "Day 8: I Heard You Like Registers"

  def part1(input) do
    input
    |> Stream.map(&String.split/1)
    |> Enum.reduce({%{}, 0}, &execute_command/2)
    |> elem(0)
    |> Map.values
    |> Enum.max
  end

  def part2(input) do
    input
    |> Stream.map(&String.split/1)
    |> Enum.reduce({%{}, 0}, &execute_command/2)
    |> elem(1)
  end

  defp execute_command([reg, dir, delta, _, ref, op, num], {map, _} = acc) do
    op = String.to_atom(op)
    num = String.to_integer(num)
    if apply(Kernel, op, [val(map, ref), num]) do
      delta = String.to_integer(delta)
      new_reg_val = case dir do
        "inc" -> val(map, reg) + delta
        "dec" -> val(map, reg) - delta
      end
      {Map.put(map, reg, new_reg_val), determine_max(acc)}
    else
      acc
    end
  end

  defp determine_max({map, max}) do
    current_max = map |> Map.values |> Enum.max(fn -> 0 end)
    if max < current_max do current_max else max end
  end

  defp val(map, key) do
    Map.get(map, key, 0)
  end

end
