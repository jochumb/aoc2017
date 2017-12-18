defmodule Day17Test do
  use ExUnit.Case
  @moduledoc "Input for day 17"

  test "Test input part 1" do
    result = Day17.part1(3)
    assert result == 638
  end

  @steps 343

  test "Solution for part 1" do
    result = Day17.part1(@steps)
    IO.puts "Day 17 part 1: #{result}"
    assert result == 1914
  end

  test "Solution for part 2" do
    result = Day17.part2(@steps)
    IO.puts "Day 17 part 2: #{result}"
    # assert result == 1914
  end
end
