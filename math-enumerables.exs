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

  @doc """
  Multiplies the range elements by 2.

  Returns list.

  ## Examples
      iex> MyApp.Math.Enumerables.double_enum_with_range(1, 5)
      [2, 4, 6, 8, 10]
      ...

  """
  @spec double_enum_with_range(number(), number()) :: list()
  def double_enum_with_range(range1, range2) do
    Enum.map(range1..range2, fn x -> x * 2 end)
  end

  @spec double_enum_with_range(number(), number()) :: list()
  def sum_enum_with_range(range1, range2) do
    Enum.reduce(range1..range2, 0, &+/2)
  end


  @doc """
  Extracts odd numbers from the list.

  Returns list.

  ## Examples
      iex> MyApp.Math.Enumerables.list_odd_numbers([1, 2, 3, 4, 5])
      [1, 3, 5]
      ...

  """
  @spec list_odd_numbers(list()) :: list()
  def list_odd_numbers(list) do
    # anonymous function
    odd? = &(rem(&1, 2) != 0)

    # Pipe operator
    list |> Enum.filter(odd?)
  end

  @spec list_odd_numbers_lazily(list(), number()) :: list()
  def list_odd_numbers_lazily(list, take) do
    odd? = &(rem(&1, 2) != 0)

    # First parameter is passed by the pipe operator
    list |> Stream.filter(odd?) |> Enum.take(take)
  end
end

# Print number, string etc.
IO.puts(MyApp.Math.Enumerables.enum_sum_list([1, 6, 6]))

# Print list
IO.inspect(MyApp.Math.Enumerables.double_enum_with_range(1, 2))
IO.inspect(MyApp.Math.Enumerables.list_odd_numbers_lazily(1..10000, 10))