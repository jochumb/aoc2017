defmodule Day07Test do
  use ExUnit.Case
  @moduledoc "Input for day 7"

  test "Test input part 1" do
    input_str = Utils.File.read_lines_from_file("./testinput")
    assert Day07.part1(input_str) == "tknk"
  end

  test "Solution for part 1" do
    input_str = Utils.File.read_lines_from_file("./input")
    result = Day07.part1(input_str)
    IO.puts "Day 7 part 1: #{result}"
    assert result == "aapssr"
  end

  test "Test input part 2" do
    input_str = Utils.File.read_lines_from_file("./testinput")
    assert Day07.part2(input_str) == 60
  end

  test "Solution for part 2" do
    input_str = Utils.File.read_lines_from_file("./input")
    result = Day07.part2(input_str)
    IO.puts "Day 7 part 2: #{result}"
    assert result == 1_458
  end
end
