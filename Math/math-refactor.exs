defmodule MyApp.MathRef do
  @moduledoc """
  This is a meaningless math module, developed to learn the fundamentals of Elixir.
  """

  @doc """
  Applies operation selected to the two number.

  Returns string.

  ## Examples
      iex> MyApp.MathRef.operate(6, 1, :sum)
      Result: 7

      iex> MyApp.MathRef.operate(6, 1, :subtract, %{description: "Another description: "})
      Another description:  5

      iex> MyApp.MathRef.operate(3, 2, :multiply, %{description: "Another description: "})
      Another description:  6

      iex>MyApp.MathRef.operate(5, 2, :divide, %{description: "Another description: "})
      Another description:  2.5
      ...

  """
  @spec operate(number(), number(), :sum | :subtract | :multiply | :divide, %{optional(:description) => String.t()}) :: String.t()
  def operate(num1, num2, operation, opts \\ %{}) do
    description = Map.get(opts, :description, "Result:")

    sum = &+/2
    subtract = &-/2
    multiply = &*/2
    divide = &//2

    result = case operation do
      :sum -> Integer.to_string(sum.(num1, num2))
      :subtract -> Integer.to_string(subtract.(num1, num2))
      :multiply -> Integer.to_string(multiply.(num1, num2))
      :divide -> Float.to_string(divide.(num1, num2))
    end

    description <> " " <> result
  end
end
