defmodule Day13Test do
  use ExUnit.Case
    @moduledoc "Input for day 13"

    test "Test input part 1" do
      assert Day13.part1(
        ["0: 3",
        "1: 2",
        "4: 4",
        "6: 4"]) == 24
    end

    test "Solution for part 1" do
      input_str = Utils.File.read_lines_from_file("./input")
      result = Day13.part1(input_str)
      IO.puts "Day 13 part 1: #{result}"
      assert result == 1_580
    end

    test "Test input part 2" do
      assert Day13.part2(
        ["0: 3",
        "1: 2",
        "4: 4",
        "6: 4"]) == 10
    end

    test "Solution for part 2" do
      input_str = Utils.File.read_lines_from_file("./input")
      result = Day13.part2(input_str)
      IO.puts "Day 13 part 2: #{result}"
      assert result == 3_943_252
    end
end
