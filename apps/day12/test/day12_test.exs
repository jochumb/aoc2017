defmodule Day12Test do
  use ExUnit.Case
  @moduledoc "Input for day 12"

  test "Test input part 1" do
    assert Day12.part1(
      ["0 <-> 2",
       "1 <-> 1",
       "2 <-> 0, 3, 4",
       "3 <-> 2, 4",
       "4 <-> 2, 3, 6",
       "5 <-> 6",
       "6 <-> 4, 5"]) == 6
  end

  test "Solution for part 1" do
    input_str = Utils.File.read_lines_from_file("./input")
    result = Day12.part1(input_str)
    IO.puts "Day 12 part 1: #{result}"
    assert result == 141
  end

  test "Test input part 2" do
    assert Day12.part2(
      ["0 <-> 2",
       "1 <-> 1",
       "2 <-> 0, 3, 4",
       "3 <-> 2, 4",
       "4 <-> 2, 3, 6",
       "5 <-> 6",
       "6 <-> 4, 5"]) == 2
  end

  test "Solution for part 2" do
    input_str = Utils.File.read_lines_from_file("./input")
    result = Day12.part2(input_str)
    IO.puts "Day 12 part 2: #{result}"
    assert result == 171
  end
end
