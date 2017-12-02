defmodule Utils.File do
  @moduledoc "File reading utilities"

  @spec read_first_line_from_file(String.t) :: String.t
  def read_first_line_from_file(filename) do
    filename |> read_lines_from_file |> hd
  end

  @spec read_lines_from_file(String.t) :: [String.t]
  def read_lines_from_file(filename) do
    {:ok, file} = File.open(filename, [:read])
    output = file
      |> IO.stream(:line)
      |> Enum.map(&String.trim_trailing/1)
    File.close(file)
    output
  end

end
