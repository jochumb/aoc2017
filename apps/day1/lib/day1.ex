defmodule Day1 do

  def part1(num_str) do
    num_str
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> zip_with_rotated(1)
      |> Enum.reduce(0, &add_if_equal/2)
  end

  def zip_with_rotated(list, rotation) do
    rotate(list, rotation) 
      |> Enum.zip(list)
  end

  def rotate(list, 0), do: list
  def rotate([x|xs], k), do: rotate(xs ++ [x], k-1)

  def add_if_equal({x, y}, acc) when x == y, do: acc + x
  def add_if_equal(_, acc), do: acc

  def part2(num_str) do
    num_str
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> zip_with_rotated(round(String.length(num_str)/2))
      |> Enum.reduce(0, &add_if_equal/2)
  end

  def filename_to_string(filename) do
    {:ok, file} = File.open(filename, [:read])
    output_str = IO.read(file, :line) |> String.trim_trailing
    File.close(file)
    output_str
  end

end
