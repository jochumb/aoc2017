defmodule Day04 do
  @moduledoc "Day 4: High-Entropy Passphrases"

  def part1(str_list) do
    str_list
    |> Enum.filter(&is_valid_password/1)
    |> Enum.count
  end

  def is_valid_password(str) do
    str
    |> String.split
    |> has_no_duplicates
  end

  defp has_no_duplicates(list) do
    Enum.count(list) == Enum.count(Enum.uniq(list))
  end

  def part2(str_list) do
    str_list
    |> Enum.filter(&is_valid_password_anagrams/1)
    |> Enum.count
  end

  def is_valid_password_anagrams(str) do
    str
    |> String.split
    |> Enum.map(&alphabetize_word/1)
    |> has_no_duplicates
  end

  defp alphabetize_word(str) do
    str
    |> to_charlist
    |> Enum.sort
    |> to_string
  end
end
