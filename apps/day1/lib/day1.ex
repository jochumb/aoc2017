defmodule Day1 do

  def part1(num_str), do: num_str |> to_int_list |> calculate(1)

  def part2(num_str), do: num_str |> to_int_list |> calculate(div(String.length(num_str),2))

  def to_int_list(num_str) do
    num_str
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def calculate(num_list, offset) do
    num_list
    |> Stream.cycle
    |> Stream.drop(offset)
    |> Stream.zip(num_list)
    |> Stream.filter(&(match?({x,x}, &1)))
    |> Stream.map(&(elem(&1, 0)))
    |> Enum.sum
  end

end
