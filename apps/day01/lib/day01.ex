defmodule Day01 do

  def part1(num_str) do
    num_str 
    |> Utils.List.convert_to_int_list("") 
    |> calculate(1)
  end

  def part2(num_str) do 
    num_str 
    |> Utils.List.convert_to_int_list("") 
    |> calculate(div(String.length(num_str),2))
  end
  
  def calculate(num_list, offset) do
    num_list
    |> Stream.cycle
    |> Stream.drop(offset)
    |> Stream.zip(num_list)
    |> Stream.filter(&(match?({x,x}, &1)))
    |> Stream.map(&(elem(&1, 0)))
    |> Enum.sum
  end

end
