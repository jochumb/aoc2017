defmodule Day2 do
  
  def part1(str_list), do: str_list |> to_int_list_list |> calculate_minmax_sum

  def part2(str_list), do: str_list |> to_int_list_list |> calculated_divisable_sum

  def to_int_list_list(str_list) do
    str_list
    |> Enum.map(&String.split/1)
    |> Enum.map(fn list -> Enum.map(list, &String.to_integer/1) end)
  end

  def calculate_minmax_sum(spreadsheet) do
    spreadsheet
    |> Enum.map(&row_diff/1)
    |> Enum.sum
  end

  def row_diff(row) do
    Enum.max(row) - Enum.min(row)
  end

  def calculated_divisable_sum(spreadsheet) do
    spreadsheet
    |> Enum.map(&row_divisables/1)
    |> Enum.sum
  end

  def row_divisables(row) do
    row
    |> Enum.sort(&(&1 >= &2))
    |> Utils.Math.combinations(2)
    |> Enum.map(&List.to_tuple/1)
    |> Enum.filter(fn {x, y} -> rem(x, y) == 0 end)
    |> hd
    |> (fn {x, y} -> div(x, y) end).()
  end

end
