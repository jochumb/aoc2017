defmodule Day03Test do
  use ExUnit.Case
  @moduledoc "Input for day 3"

  @input 277_678

  test "Test input day 3" do
    assert Day03.part1(1) == 0
    assert Day03.part1(12) == 3
    assert Day03.part1(21) == 4
    assert Day03.part1(22) == 3
    assert Day03.part1(23) == 2
    assert Day03.part1(24) == 3
    assert Day03.part1(25) == 4
    assert Day03.part1(1024) == 31
  end

  test "Solution for part 1" do
    result = Day03.part1(@input)
    IO.puts "Day 3 part 1: #{result}"
    assert result == 475
  end

  test "Solution for part 2" do
    result = Day03.part2(@input)
    IO.puts "Day 3 part 2: #{result}"
    assert result == 279_138
  end
end
