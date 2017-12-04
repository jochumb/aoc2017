defmodule Day04Test do
  use ExUnit.Case
  @moduledoc "Input for day 4"

    test "Test input part2" do
      assert Day04.is_valid_password("aa bb cc dd ee") == true
      assert Day04.is_valid_password("aa bb cc dd aa") == false
      assert Day04.is_valid_password("aa bb cc dd aaa") == true
    end

    test "Solution for part 1" do
      input_str = Utils.File.read_lines_from_file("./input")
      result = Day04.part1(input_str)
      IO.puts "Day 4 part 1: #{result}"
      assert result == 451
    end

    test "Test input part 2" do
      assert Day04.is_valid_password_anagrams("abcde fghij") == true
      assert Day04.is_valid_password_anagrams("abcde xyz ecdab") == false
      assert Day04.is_valid_password_anagrams("a ab abc abd abf abj") == true
      assert Day04.is_valid_password_anagrams("iiii oiii ooii oooi oooo") == true
      assert Day04.is_valid_password_anagrams("oiii ioii iioi iiio") == false
    end

    test "Solution for part 2" do
      input_str = Utils.File.read_lines_from_file("./input")
      result = Day04.part2(input_str)
      IO.puts "Day 4 part 2: #{result}"
      assert result == 223
    end
end
