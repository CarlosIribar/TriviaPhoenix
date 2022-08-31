defmodule Trivia.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question1, :text
      add :question2, :text
      add :question3, :text
      add :question4, :text
      add :anwser, :integer
      add :valid, :boolean, default: false, null: false
      add :creator, :string

      timestamps()
    end
  end
end
