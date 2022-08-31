defmodule Trivia.Repo.Migrations.AddQuestionfieldToQuestion do
  use Ecto.Migration

  def change do
    alter table(:questions) do
      add :question, :text
    end

    rename table(:questions), :question1, to: :answer1
    rename table(:questions), :question2, to: :answer2
    rename table(:questions), :question3, to: :answer3
    rename table(:questions), :question4, to: :answer4
  end
end
