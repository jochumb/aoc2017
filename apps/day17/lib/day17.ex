defmodule Day17 do
  @moduledoc "Day 17: Spinlock"

  def part1(steps) do
    1..2017
    |> Enum.to_list
    |> Enum.reduce({[0], 1},
      fn n, {buffer, index} ->
        step_and_insert(buffer, index, steps, n)
      end)
    |> (fn {buffer, index} -> Enum.at(buffer, index + 1) end).()
  end

  defp step_and_insert(buffer, index, steps, n) do
    # IO.inspect buffer
    insert_at = rem(index + steps, Enum.count(buffer)) + 1
    {front, back} = Enum.split(buffer, insert_at)
    {front ++ [n | back], insert_at}
  end

  def part2(steps) do
    1..50_000_000
    |> Enum.to_list
    |> Enum.reduce({steps, 0, 0},
      fn n, {steps, index, val} ->
        add_to_buffer(n, steps, index, val)
      end)
    |> (fn {_, _, val} -> val end).()
  end

  defp add_to_buffer(n, steps, index, val) do
    # new_index = rem(index + steps, n)
    # IO.puts "#{n}: #{index},  #{val}, #{new_index}"
    case rem(index + steps + 1, n) do
      i when i == 0 -> {steps, i, n}
      i -> {steps, i, val}
    end
  end
end
