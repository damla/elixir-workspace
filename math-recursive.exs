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

      iex> MyApp.Math.Recursive.operate(3, 2, :factorial, %{description: "Another description:"})
      Another description:  6
      ...

  """
  @spec operate(number(), number() | nil, :sum | :subtract | :factorial, %{optional(:description) => String.t()}) :: String.t()
  def operate(num1, num2, operation, opts \\ %{}) do
    description = Map.get(opts, :description, "Result:")

    result = case operation do
      :sum -> Integer.to_string(sum(num1, num2))
      :subtract -> Integer.to_string(subtract(num1, num2))
      :factorial -> Integer.to_string(factorial(num1))
    end

    description <> " " <> result
  end

  defp sum(num1, num2) when num2 > 0 do
    sum(num1 + 1, num2 - 1)
  end

  defp sum(num1, num2) when num2 == 0 do
    num1
  end

  defp subtract(num1, num2) when num2 > 0 do
    subtract(num1 - 1, num2 - 1)
  end

  defp subtract(num1, num2) when num2 == 0 do
    num1
  end

  defp factorial(num1) when num1 > 0 do
    num1 * factorial(num1 - 1)
  end

  defp factorial(num1) when num1 == 0 do
    1
  end
end
