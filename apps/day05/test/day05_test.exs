defmodule Day05Test do
  use ExUnit.Case
  @moduledoc "Input for day 5"

  test "Test input part 1" do
    assert Day05.part1(["0", "3", "0", "1", "-3"]) == 5
  end

  test "Solution for part 1" do
    input_str = Utils.File.read_lines_from_file("./input")
    result = Day05.part1(input_str)
    IO.puts "Day 5 part 1: #{result}"
    assert result == 396_086
  end

  test "Test input part 2" do
    assert Day05.part2(["0", "3", "0", "1", "-3"]) == 10
  end

  test "Solution for part 2" do
    input_str = Utils.File.read_lines_from_file("./input")
    result = Day05.part2(input_str)
    IO.puts "Day 5 part 2: #{result}"
    assert result == 28_675_390
  end

end
