defmodule Day1 do

  def part1(num_str), do: calculate(num_str, 1)

  def part2(num_str), do: calculate(num_str, round(String.length(num_str)/2))

  def calculate(num_str, rotation) do
    num_str
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> zip_with_rotated(rotation)
    |> Enum.reduce(0, &add_if_equal/2)
  end

  def zip_with_rotated(list, rotation) do
    rotate(list, rotation) 
    |> Enum.zip(list)
  end

  def rotate(list, k), do: Enum.drop(list, k) ++ Enum.take(list, k)

  def add_if_equal({x, y}, acc) when x == y, do: acc + x
  def add_if_equal(_, acc), do: acc

end
