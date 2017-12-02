defmodule Utils.List do

  @spec convert_to_int_list([String.t]) :: [integer]
  def convert_to_int_list(num_str) do
    num_str
    |> String.split
    |> Enum.map(&String.to_integer/1)
  end

  @spec convert_to_int_list([String.t], String.t) :: [integer]
  def convert_to_int_list(num_str, delimiter) do
    num_str
    |> String.split(delimiter, trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  @spec combinations([any], integer) :: [[any]]
  def combinations(_, 0), do: [[]]
  def combinations([], _), do: []
  def combinations([h|t], m) do
    (for l <- combinations(t, m-1), do: [h|l]) ++ combinations(t, m)
  end
  
end
