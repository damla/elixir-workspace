defmodule ExerciseApi.Repo do
  use Ecto.Repo,
    otp_app: :exercise_api,
    adapter: Ecto.Adapters.Postgres
end
