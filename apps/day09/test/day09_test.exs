defmodule Day09Test do
  use ExUnit.Case
  @moduledoc "Input for day 9"

  test "Test input part 1" do
    assert Day09.part1("{}") == 1
    assert Day09.part1("{{{}}}") == 6
    assert Day09.part1("{{},{}}") == 5
    assert Day09.part1("{{{},{},{{}}}}") == 16
    assert Day09.part1("{<a>,<a>,<a>,<a>}") == 1
    assert Day09.part1("{{<ab>},{<ab>},{<ab>},{<ab>}}") == 9
    assert Day09.part1("{{<!!>},{<!!>},{<!!>},{<!!>}}") == 9
    assert Day09.part1("{{<a!>},{<a!>},{<a!>},{<ab>}}") == 3
  end

  test "Solution for part 1" do
    input_str = Utils.File.read_first_line_from_file("./input")
    result = Day09.part1(input_str)
    IO.puts "Day 9 part 1: #{result}"
    assert result == 14_421
  end

  test "Test input part 2" do
    assert Day09.part2("<>") == 0
    assert Day09.part2("<random characters>") == 17
    assert Day09.part2("<<<<>") == 3
    assert Day09.part2("<{!>}>") == 2
    assert Day09.part2("<!!>") == 0
    assert Day09.part2("<!!!>>") == 0
    assert Day09.part2("<{o\"i!a,<{i<a>") == 10
  end

  test "Solution for part 2" do
    input_str = Utils.File.read_first_line_from_file("./input")
    result = Day09.part2(input_str)
    IO.puts "Day 9 part 2: #{result}"
    assert result == 6_817
  end
end
