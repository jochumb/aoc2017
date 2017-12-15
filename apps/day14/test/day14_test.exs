defmodule Day14Test do
  use ExUnit.Case
  @moduledoc "Input for day 14"

  @input "oundnydw"

  test "Test input part 1" do
    result = Day14.part1("flqrgnkx")
    assert result == 8_108
  end

  test "Solution for part 1" do
    result = Day14.part1(@input)
    IO.puts "Day 14 part 1: #{result}"
    assert result == 8_106
  end

  test "Test input part 2" do
    result = Day14.part2("flqrgnkx")
    assert result == 1_242
  end

  test "Solution for part 2" do
    result = Day14.part2(@input)
    IO.puts "Day 14 part 2: #{result}"
    assert result == 1_164
  end
end
