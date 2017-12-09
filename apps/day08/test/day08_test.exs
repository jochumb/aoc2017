defmodule Day08Test do
  use ExUnit.Case
  @moduledoc "Input for day 8"

  test "Test input part 1" do
    assert Day08.part1(
      ["b inc 5 if a > 1",
       "a inc 1 if b < 5",
       "c dec -10 if a >= 1",
       "c inc -20 if c == 10"]) == 1
  end

  test "Solution for part 1" do
    input_str = Utils.File.read_lines_from_file("./input")
    result = Day08.part1(input_str)
    IO.puts "Day 8 part 1: #{result}"
    assert result == 4_877
  end

  test "Test input part 2" do
    assert Day08.part2(
      ["b inc 5 if a > 1",
       "a inc 1 if b < 5",
       "c dec -10 if a >= 1",
       "c inc -20 if c == 10"]) == 10
  end

  test "Solution for part 2" do
    input_str = Utils.File.read_lines_from_file("./input")
    result = Day08.part2(input_str)
    IO.puts "Day 8 part 2: #{result}"
    # assert result == 4_877
  end
end
