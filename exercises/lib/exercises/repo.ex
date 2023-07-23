defmodule Exercises.Repo do
  use Ecto.Repo,
    otp_app: :exercises,
    adapter: Ecto.Adapters.Postgres
end
