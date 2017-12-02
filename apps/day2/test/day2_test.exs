defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "Test input part 1" do
    list = ["5 1 9 5",
            "7 5 3",
            "2 4 6 8"]
    assert Day2.part1(list) == 18
  end

  test "Solution for part 1" do
    input_str = Utils.File.read_lines_from_file("./input")
    assert Day2.part1(input_str) == 41919
  end

  test "Test input part 2" do
    list = ["5 9 2 8",
            "9 4 7 3",
            "3 8 6 5"]
    assert Day2.part2(list) == 9
  end

  test "Solution for part 2" do
    input_str = Utils.File.read_lines_from_file("./input")
    assert Day2.part2(input_str) == 303
  end
  
end
