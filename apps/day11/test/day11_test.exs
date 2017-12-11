defmodule Day11Test do
  use ExUnit.Case
  @moduledoc "Input for day 11"

  test "Test input part 1" do
    assert Day11.part1("ne,ne,ne") == 3
    assert Day11.part1("ne,ne,sw,sw") == 0
    assert Day11.part1("ne,ne,s,s") == 2
    assert Day11.part1("se,sw,se,sw,sw") == 3
  end

  test "Solution for part 1" do
    input_str = Utils.File.read_first_line_from_file("./input")
    result = Day11.part1(input_str)
    IO.puts "Day 11 part 1: #{result}"
    assert result == 877
  end

  test "Solution for part 2" do
    input_str = Utils.File.read_first_line_from_file("./input")
    result = Day11.part2(input_str)
    IO.puts "Day 11 part 2: #{result}"
    assert result == 1_622
  end
end
