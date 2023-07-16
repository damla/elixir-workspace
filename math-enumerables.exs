defmodule MyApp.Math.Enumerables do
  @moduledoc """
  This is a meaningless math module w/ enumerables, developed to learn the fundamentals of Elixir.
  """

  @doc """
  Sums the list elements.

  Returns number.

  ## Examples
      iex> MyApp.Math.Enumerables.enum_sum_list([1, 6, 6])
      13
      ...

  """
  @spec enum_sum_list(list()) :: list()
  def enum_sum_list(list1) do
    Enum.sum(list1)
  end

  @doc """
  Applies operation selected to the list elements by the accumulator.

  Returns list.

  ## Examples
      iex> MyApp.Math.Enumerables.enum_map_list([1, 6, 6], :sum, 1)
      [2, 7, 7]

      iex> MyApp.Math.Enumerables.enum_map_list([1, 6, 6], :multiply, 2)
      [2, 12, 12]
      ...

  """
  @spec enum_map_list(list(), :sum | :multiply, number()) :: list()
  def enum_map_list(list1, operator, acc) do
    case operator do
      :sum -> Enum.map(list1, fn x -> x + acc end)
      :multiply -> Enum.map(list1, fn x -> x * acc end)
    end
  end
end
