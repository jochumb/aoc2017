defmodule Utils.File do

  def read_first_line_from_file(filename) do
    {:ok, file} = File.open(filename, [:read])
    output = IO.read(file, :line) |> String.trim_trailing
    File.close(file)
    output
  end

  def read_lines_from_file(filename) do
    {:ok, file} = File.open(filename, [:read])
    output = IO.stream(file, :line) 
      |> Enum.map(&String.trim_trailing/1)
    File.close(file)
    output
  end
  
end
