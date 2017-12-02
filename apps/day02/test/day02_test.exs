defmodule Day02Test do
  use ExUnit.Case
  @moduledoc "Day 2 input"

  test "Test input part 1" do
    list = ["5 1 9 5",
            "7 5 3",
            "2 4 6 8"]
    assert Day02.part1(list) == 18
  end

  test "Solution for part 1" do
    input_str = Utils.File.read_lines_from_file("./input")
    result = Day02.part1(input_str)
    IO.puts "Day 2 part 1: #{result}"
    assert result == 41_919
  end

  test "Test input part 2" do
    list = ["5 9 2 8",
            "9 4 7 3",
            "3 8 6 5"]
    assert Day02.part2(list) == 9
  end

  test "Solution for part 2" do
    input_str = Utils.File.read_lines_from_file("./input")
    result = Day02.part2(input_str)
    IO.puts "Day 2 part 2: #{result}"
    assert result == 303
  end

end
