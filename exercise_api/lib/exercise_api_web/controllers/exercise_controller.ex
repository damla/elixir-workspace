defmodule ExerciseApiWeb.ExerciseController do
  use ExerciseApiWeb, :controller

  def index(conn, _params) do
    json(conn, %{res: "test"})
  end
end
