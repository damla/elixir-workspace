defmodule MyApp.Math.Recursive do
  @moduledoc """
  This is a meaningless math module w/ recursive functions, developed to learn the fundamentals of Elixir.
  """

  @doc """
  Applies operation selected to the two number.

  Returns string.

  ## Examples
      iex> MyApp.Math.Recursive.operate(6, 1, :sum)
      Result: 7

      iex> MyApp.Math.Recursive.operate(6, 1, :subtract, %{description: "Another description:"})
      Another description:  5

      iex> MyApp.Math.Recursive.operate(3, nil, :factorial)
      Another description:  6
      ...

  """
  @spec operate(non_neg_integer(), non_neg_integer() | nil, :sum | :subtract | :factorial, %{optional(:description) => String.t()}) :: String.t()
  def operate(num1, num2, operation, opts \\ %{}) do
    description = Map.get(opts, :description, "Result:")

    result = case operation do
      :sum -> Integer.to_string(sum(num1, num2))
      :subtract -> Integer.to_string(subtract(num1, num2))
      :factorial ->
        case factorial(num1) do
        {:ok, val} -> Integer.to_string(val)
        {:error, _reason} -> "Error calculating factorial"
        end
    end

    description <> " " <> result
  end

  defp sum(num1, num2) do
    cond do
      num2 == 0 -> num1
      num2 > 0 -> sum(num1 + 1, num2 - 1)
      num2 < 0 -> sum(num1 - 1, num2 + 1)
    end
  end


  defp subtract(num1, num2) do
    cond do
      num2 == 0 -> num1
      num2 > 0 -> subtract(num1 - 1, num2 - 1)
      num2 < 0 -> subtract(num1 + 1, num2 + 1)
    end
  end

  defp factorial(num1) do
    cond do
      num1 == 0 -> {:ok, 1}
      num1 > 0 -> {:ok, num1 * factorial(num1 - 1)}
      num1 < 0 -> {:error, "Cannot take factorial of a negative number"}
    end
  end

  @doc """
    Accumulates the sum of the list.

  Returns list.

  ## Examples
      iex> MyApp.Math.Recursive.sum_list([1, 2, 3], 0)
      6
      ...
  """
  @spec sum_list(list(), non_neg_integer()) :: String.t()
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end
end
