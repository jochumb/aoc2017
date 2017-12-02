defmodule Day01Test do
  use ExUnit.Case
  @moduledoc "Day 1 input"

  test "Test input part 1" do
    assert Day01.part1("1122") == 3
    assert Day01.part1("1111") == 4
    assert Day01.part1("1234") == 0
    assert Day01.part1("91212129") == 9
  end

  test "Solution for part 1" do
    input_str = Utils.File.read_first_line_from_file("./input")
    result = Day01.part1(input_str)
    IO.puts "Day 1 part 1: #{result}"
    assert result == 1158
  end

  test "Test input part 2" do
    assert Day01.part2("1212") == 6
    assert Day01.part2("1221") == 0
    assert Day01.part2("123425") == 4
    assert Day01.part2("123123") == 12
    assert Day01.part2("12131415") == 4
  end

  test "Solution for part 2" do
    input_str = Utils.File.read_first_line_from_file("./input")
    result = Day01.part2(input_str)
    IO.puts "Day 1 part 2: #{result}"
    assert result == 1132
  end

end
