defmodule Day1Test do
  use ExUnit.Case

  test "Sum of 1122 = 3" do
    assert Day1.part1("1122") == 3
  end

  test "Sum of 1111 = 4" do
    assert Day1.part1("1111") == 4
  end

  test "Sum of 1234 = 0" do
    assert Day1.part1("1234") == 0
  end

  test "Sum of 91212129 = 9" do
    assert Day1.part1("91212129") == 9
  end

  test "Solution for part 1" do
    input_str = Day1Test.filename_to_string("./input")
    assert Day1.part1(input_str) == 1158
  end

  test "Part 2 sum of 1212 = 6" do
    assert Day1.part2("1212") == 6
  end

  test "Part 2 sum of 1221 = 0" do
    assert Day1.part2("1221") == 0
  end

  test "Part 2 sum of 123425 = 4" do
    assert Day1.part2("123425") == 4
  end

  test "Part 2 sum of 123123 = 12" do
    assert Day1.part2("123123") == 12
  end

  test "Part 2 sum of 12131415 = 4" do
    assert Day1.part2("12131415") == 4
  end

  test "Solution for part 2" do
    input_str = Day1Test.filename_to_string("./input")
    assert Day1.part2(input_str) == 1132
  end

  def filename_to_string(filename) do
    {:ok, file} = File.open(filename, [:read])
    output_str = IO.read(file, :line) |> String.trim_trailing
    File.close(file)
    output_str
  end

end
