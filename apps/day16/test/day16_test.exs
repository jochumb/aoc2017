defmodule Day16Test do
  use ExUnit.Case
  @moduledoc "Input for day 16"

  test "Test input part 1" do
    assert Day16.part1("abcde",
      ["s1",
      "x3/4",
      "pe/b"]) == "baedc"
  end

  @str "abcdefghijklmnop"

  test "Solution for part 1" do
    instructions = "./input"
    |> Utils.File.read_first_line_from_file
    |> String.split(",")
    result = Day16.part1(@str, instructions)
    IO.puts "Day 16 part 1: #{result}"
    assert result == "hmefajngplkidocb"
  end

  test "Solution for part 2" do
    instructions = "./input"
    |> Utils.File.read_first_line_from_file
    |> String.split(",")
    result = Day16.part2(@str, instructions)
    IO.puts "Day 16 part 2: #{result}"
    assert result == "fbidepghmjklcnoa"
  end
end
