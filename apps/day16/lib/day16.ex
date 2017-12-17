defmodule Day16 do
  @moduledoc "Day 16: Permutation Promenade"

  def part1(str, instructions) do
    instructions
    |> Enum.reduce(str, &exec/2)
  end

  def part2(str, instructions) do
    cycle = str
    |> count_before_original(instructions, [], str)
    index = rem(1_000_000_000, cycle |> Enum.count) - 1
    Enum.at(cycle, index)
  end

  defp count_before_original(str, instructions, agr, original) do
    new_str = instructions
    |> Enum.reduce(str, &exec/2)
    if new_str == original do
      [new_str|agr] |> Enum.reverse
    else
      count_before_original(new_str, instructions, [new_str|agr], original)
    end
  end

  defp exec("s" <> num, str) do
    count = String.to_integer(num)
    {back, front} = String.split_at(str, count * -1)
    front <> back
  end

  defp exec("x" <> target, str) do
    [x, y] = target |> String.split("/")
    first = String.at(str, String.to_integer(x))
    second = String.at(str, String.to_integer(y))
    switch(str, first, second)
  end

  defp exec("p" <> target, str) do
    [x, y] = target |> String.split("/")
    switch(str, x, y)
  end

  defp exec(_, str), do: str

  defp switch(str, first, second) do
    str
    |> String.replace(first, "x")
    |> String.replace(second, first)
    |> String.replace("x", second)
  end

end
