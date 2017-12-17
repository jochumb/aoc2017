defmodule Day15 do
  @moduledoc "Day 15: Dueling Generators"

  @factor_a 16_807
  @factor_b 48_271
  @devider 2_147_483_647

  def part1(a, b) do
    gen_a = generator(a, @factor_a)
    gen_b = generator(b, @factor_b)

    gen_a
    |> Stream.zip(gen_b)
    |> Stream.take(40_000_000)
    |> Stream.filter(fn {a_bits, b_bits} -> a_bits == b_bits end)
    |> Enum.to_list
    |> Enum.count
  end

  def part2(a, b) do
    gen_a = generator(a, @factor_a, 4)
    gen_b = generator(b, @factor_b, 8)

    gen_a
    |> Stream.zip(gen_b)
    |> Stream.take(5_000_000)
    |> Stream.filter(fn {a_bits, b_bits} -> a_bits == b_bits end)
    |> Enum.to_list
    |> Enum.count
  end

  defp generator(start, factor) do
    start
    |> Stream.iterate(& rem(&1 * factor, @devider))
    |> Stream.drop(1)
    |> Stream.map(&lowest_16_bits/1)
  end

  defp generator(start, factor, multiple) do
    start
    |> Stream.iterate(& rem(&1 * factor, @devider))
    |> Stream.filter(fn n -> rem(n, multiple) == 0 end)
    |> Stream.drop(1)
    |> Stream.map(&lowest_16_bits/1)
  end

  defp lowest_16_bits(n) when is_integer(n) do
    n
    |> Integer.digits(2)
    |> Enum.take(-16)
  end

end
