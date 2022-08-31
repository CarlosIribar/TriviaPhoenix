defmodule Trivia.Repo.Migrations.RenameAnswer do
  use Ecto.Migration

  def change do
    rename table(:questions), :anwser, to: :answer
  end
end
