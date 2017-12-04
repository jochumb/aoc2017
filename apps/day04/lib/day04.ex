defmodule Day04 do
  @moduledoc "Day 4: High-Entropy Passphrases"

  def part1(str_list), do: solve_with_filter(str_list, &is_valid_password/1)

  def part2(str_list), do: solve_with_filter(str_list, &is_valid_password_anagrams/1)

  def solve_with_filter(str_list, filter) do
    str_list |> Enum.filter(filter) |> Enum.count
  end

  def is_valid_password(str) do
    str |> String.split |> has_no_duplicates
  end

  def is_valid_password_anagrams(str) do
    str
    |> String.split
    |> Enum.map(&alphabetize_word/1)
    |> has_no_duplicates
  end

  defp alphabetize_word(str) do
    str |> to_charlist |> Enum.sort
  end

  defp has_no_duplicates(list) do
    Enum.count(list) == Enum.count(Enum.uniq(list))
  end
end
