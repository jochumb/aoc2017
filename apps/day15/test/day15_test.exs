defmodule Day15Test do
  use ExUnit.Case
  @moduledoc "Input for day 15"

  @input_a 699
  @input_b 124

  test "Test input part 1" do
    result = Day15.part1(65, 8_921)
    assert result == 588
  end

  test "Solution for part 1" do
    result = Day15.part1(@input_a, @input_b)
    IO.puts "Day 15 part 1: #{result}"
    assert result == 600
  end

  test "Test input part 2" do
    result = Day15.part2(65, 8_921)
    assert result == 309
  end

  test "Solution for part 2" do
    result = Day15.part2(@input_a, @input_b)
    IO.puts "Day 15 part 2: #{result}"
    assert result == 313
  end
end
