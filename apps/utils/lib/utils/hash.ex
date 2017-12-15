defmodule Utils.Hash do
  use Bitwise
  @moduledoc "String manipulation utilities"

  @addition [17, 31, 73, 47, 23]
  def knot_hash(str) do
    str
    |> String.to_charlist
    |> Enum.concat(@addition)
    |> tie(Enum.to_list(0..255), 64)
    |> dense_hash
    |> to_hexadecimal
  end

  def tie(_, _, remaining \\ 1, index \\ 0, skip \\ 0)
  def tie(_, list, 0, _, _), do: list
  def tie(input, list, remaining, index, skip) do
    {list, index, skip} = consume(input, list, index, skip)
    tie(input, list, remaining - 1, index, skip)
  end

  defp consume([], list, index, skip), do: {list, index, skip}
  defp consume([h | t], list, index, skip) do
    next_list = reverse(list, index, h)
    next_index = rem(index + h + skip, Enum.count(list))
    consume(t, next_list, next_index, skip + 1)
  end

  defp reverse(list, start, size) do
    {front, to_reverse} = Enum.split(list, start)
    {to_reverse, back} = Enum.split(to_reverse, size)
    case size - Enum.count(to_reverse) do
      0 -> front ++ Enum.reverse(to_reverse) ++ back
      x ->
        {second_part, rest} = Enum.split(front, x)
        reversed = Enum.reverse(to_reverse ++ second_part)
        {back, front} = Enum.split(reversed, x * -1)
        front ++ rest ++ back
    end
  end

  defp dense_hash(list) do
    list
    |> Enum.chunk_every(16)
    |> Enum.map(&bitwise_xor/1)
  end

  defp bitwise_xor(list, acc \\ nil)
  defp bitwise_xor([], acc), do: acc
  defp bitwise_xor([h|t], nil), do: bitwise_xor(t, h)
  defp bitwise_xor([h|t], acc), do: bitwise_xor(t, bxor(acc, h))

  defp to_hexadecimal(list, acc \\ "")
  defp to_hexadecimal([], acc), do: acc
  defp to_hexadecimal([h|t], acc) do
    hex_val = h
    |> Integer.to_string(16)
    |> String.downcase
    |> String.pad_leading(2, "0")
    to_hexadecimal(t, acc <> hex_val)
  end

end