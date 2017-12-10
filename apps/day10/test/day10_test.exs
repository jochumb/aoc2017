defmodule Day10Test do
  use ExUnit.Case
  @moduledoc "Input for day 10"

  @input "120,93,0,90,5,80,129,74,1,165,204,255,254,2,50,113"

  test "Test input part 1" do
    assert Day10.part1(0..4, "3,4,1,5") == 12
  end

  test "Solution for part 1" do
    result = Day10.part1(0..255, @input)
    IO.puts "Day 10 part 1: #{result}"
    assert result == 826
  end

  test "Solution for part 2" do
    result = Day10.part2(0..255, @input)
    IO.puts "Day 10 part 2: #{result}"
    assert result == "d067d3f14d07e09c2e7308c3926605c4"
  end
end
