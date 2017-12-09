defmodule Day06Test do
  use ExUnit.Case
  @moduledoc "Input for day 6"

  test "Test input part 1" do
    assert Day06.part1("0	2	7	0") == 5
  end

  test "Solution for part 1" do
    input_str = Utils.File.read_first_line_from_file("./input")
    result = Day06.part1(input_str)
    IO.puts "Day 6 part 1: #{result}"
    assert result == 3_156
  end

  test "Test input part 2" do
    assert Day06.part2("0	2	7	0") == 4
  end

  test "Solution for part 2" do
    input_str = Utils.File.read_first_line_from_file("./input")
    result = Day06.part2(input_str)
    IO.puts "Day 6 part 2: #{result}"
    assert result == 1_610
  end
end
