defmodule Trivia.Repo do
  use Ecto.Repo,
    otp_app: :trivia,
    adapter: Ecto.Adapters.SQLite3
end
