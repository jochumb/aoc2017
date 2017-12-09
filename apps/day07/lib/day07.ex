defmodule Day07 do
  @moduledoc "Day 7: Recursive Circus"

  def part1(input) do
    input
    |> Enum.map(&String.split/1)
    |> Enum.map(&parse_line/1)
    |> Enum.reduce({[], []},
      fn {program, _, sub}, {progs, subs} ->
        {[program | progs], subs ++ sub}
      end)
    |> (fn {progs, subs} -> progs -- subs end).()
    |> hd
  end

  def part2(input) do
    top_program = part1(input)
    input
    |> Enum.map(&String.split/1)
    |> Enum.map(&parse_line/1)
    |> Enum.reduce(%{},
      fn {prog, weight, subs}, map ->
        Map.put(map, prog, {weight, subs})
      end)
    |> calc_prog_weight(top_program)
    |> find_imbalance(top_program)
  end

  defp calc_prog_weight(tree, prog) do
    {weight, subs} = Map.get(tree, prog)
    case subs do
      [] -> {tree, weight}
      _ ->
        {new_tree, subs_sum} = sum_weight(tree, subs)
        {Map.put(new_tree, prog, {weight + subs_sum, subs}),
        weight + subs_sum}
    end
  end

  defp sum_weight(_, _, sum \\ 0)
  defp sum_weight(tree, [], sum), do: {tree, sum}
  defp sum_weight(tree, [s|r], sum) do
    val = calc_prog_weight(tree, s)
    {new_tree, acc_weight_of_sub} = val
    sum_weight(new_tree, r, sum + acc_weight_of_sub)
  end

  defp find_imbalance({tree, _}, prog), do: find_imbalance(tree, prog, nil)
  defp find_imbalance(tree, prog, target) do
    {_, subs} = Map.get(tree, prog)
    weight_groups = group_by_weight(tree, subs)
    if balanced?(weight_groups) do
      target - (subs
        |> Enum.map(& tree |> Map.get(&1) |> elem(0))
        |> Enum.sum)
    else
      {sub, correct_weight} = unbalanced_sub_correct_weight(weight_groups, tree)
      find_imbalance(tree, sub, correct_weight)
    end
  end

  defp group_by_weight(tree, subs) do
    subs
    |> Enum.map(&({&1, Map.get(tree, &1)}))
    |> Enum.map(fn {prog, {weight, _}} -> {prog, weight} end)
    |> Enum.reduce(%{},
      fn {prog, weight}, acc ->
        Map.put(acc, weight, [prog | Map.get(acc, weight, [])])
      end)
  end

  defp balanced?(weight_groups) do
    weight_groups |> Map.keys |> Enum.count == 1
  end

  defp unbalanced_sub_correct_weight(weight_groups, tree) do
    weight_groups
    |> find_unbalanced_sub
    |> find_correct_weight(weight_groups, tree)
  end

  defp find_unbalanced_sub(weight_count) do
    weight_count
    |> Map.keys
    |> Enum.map(&(Map.get(weight_count, &1)))
    |> Enum.filter(&(Enum.count(&1) == 1))
    |> hd |> hd
  end

  defp find_correct_weight(unbalance_sub, weight_groups, tree) do
    {unbalance_sub,
      weight_groups
      |> Map.keys
      |> Enum.filter(
        fn key ->
          key != tree |> Map.get(unbalance_sub) |> elem(1)
        end)
      |> hd}
  end

  defp parse_line([program, weight]) do
    {program, weight |> weight_to_int, []}
  end

  defp parse_line([program, weight, "->" | subprograms]) do
    {program, weight |> weight_to_int,
      subprograms |> Enum.map(&(String.replace_trailing(&1, ",", "")))}
  end

  defp weight_to_int(weight) do
    weight
    |> String.replace_leading("(", "")
    |> String.replace_trailing(")", "")
    |> String.to_integer
  end
end
