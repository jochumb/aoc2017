defmodule Utils.List do
  @moduledoc "List parsing / iterating utils"

  @type delimiter :: String.pattern | Regex.t
  @spec convert_to_int_list(String.t) :: [integer]
  @spec convert_to_int_list(String.t, delimiter) :: [integer]
  def convert_to_int_list(num_str, delimiter \\ ~r{\s}) do
    num_str
    |> String.split(delimiter, trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  @spec combinations([any], integer) :: [[any]]
  def combinations(_, 0), do: [[]]
  def combinations([], _), do: []
  def combinations([h|t], m) do
    (for l <- combinations(t, m - 1), do: [h|l]) ++ combinations(t, m)
  end

end
