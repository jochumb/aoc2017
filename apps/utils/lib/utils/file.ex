defmodule Utils.File do

  @spec read_first_line_from_file(String.t) :: String.t
  def read_first_line_from_file(filename) do
    read_lines_from_file(filename) |> hd
  end

  @spec read_lines_from_file(String.t) :: [String.t]
  def read_lines_from_file(filename) do
    {:ok, file} = File.open(filename, [:read])
    output = IO.stream(file, :line) 
      |> Enum.map(&String.trim_trailing/1)
    File.close(file)
    output
  end
  
end
