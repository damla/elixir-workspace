defmodule MyApp.Math do
  @moduledoc """
  This is a meaningless math module, developed to learn the fundamentals of Elixir.
  """

  @doc """
  Sums two number.

  Returns string.

  ## Examples
      iex> MyApp.Math.sum(6, 1)
      sum: 7 is_fun: true

      iex> MyApp.Math.sum(6, 1, %{:description => "another description:"})
      another description: 7 is_fun: true

      iex> MyApp.Math.sum(6, 1, %{:description => "test:", :is_anon => true})
      test: 7 summed w/ anonymous function
  """
  @spec sum(number(), number(), %{optional(:description) => String.t(), optional(:is_anon) => boolean()}) :: String.t()
  def sum(num1, num2, opts \\ %{}) do
    description = Map.get(opts, :description, "sum:")
    is_anon = Map.get(opts, :is_anon, false)

    if is_anon do
      add = &+/2
      description <> " " <> Integer.to_string(add.(num1, num2)) <> " summed w/ anonymous function"
    else
      fun = &MyApp.Math.sum/3
      description <> " " <> Integer.to_string(do_sum(num1, num2)) <> " is_fun: " <> to_string(is_fun?(fun))
    end
  end

  @doc """
  Subtracts two number.

  Returns string.

  ## Examples

      iex> MyApp.Math.subtract(6, 1)
      subtract: 7 is_fun: true

      iex> MyApp.Math.subtract(6, 1, %{:description => "another description:"})
      another description: 5 is_fun: true

      iex> MyApp.Math.subtract(6, 1, %{:description => "test:", :is_anon => true})
      test: 5 summed w/ anonymous function
  """
  @spec subtract(number(), number(), %{optional(:description) => String.t(), optional(:is_anon) => boolean()}) :: String.t()
  def subtract(num1, num2, opts \\ %{}) do
    description = Map.get(opts, :description, "sum:")
    is_anon = Map.get(opts, :is_anon, false)

    if is_anon do
      remove = &-/2
      description <> " " <> Integer.to_string(remove.(num1, num2)) <> " subtracted w/ anonymous function"
    else
      fun = &MyApp.Math.subtract/3
      description <> " " <> Integer.to_string(do_subtract(num1, num2)) <> " is_fun: " <> to_string(is_fun?(fun))
    end
  end

  @spec do_sum(number(), number()) :: number()
  defp do_sum(a, b) do
    if zero?(a) and zero?(b) do
      0
    else
      a + b
    end
  end

  @spec do_subtract(number(), number()) :: number()
  defp do_subtract(a, b) do
    if zero?(a) and zero?(b) do
      0
    else
      a - b
    end
  end

  # question mark at the end of the function name is a convention to
  # indicate that the function returns a boolean value
  @spec zero?(number()) :: boolean()
  defp zero?(0), do: true

  @spec zero?(number()) :: boolean()
  defp zero?(x) when is_integer(x), do: false

  @spec is_fun?(function()) :: boolean()
  defp is_fun?(fun) do
    # anonymous function
    (&is_function/1).(fun)
  end
end
