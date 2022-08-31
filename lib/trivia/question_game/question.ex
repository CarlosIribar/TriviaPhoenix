defmodule Trivia.QuestionGame.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :question, :string
    field :answer, :integer
    field :creator, :string
    field :answer1, :string
    field :answer2, :string
    field :answer3, :string
    field :answer4, :string
    field :valid, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :answer1, :answer2, :answer3, :answer4, :answer, :valid, :creator])
    |> validate_required([:question, :answer1, :answer2, :answer3, :answer4, :answer, :creator])
  end

  @doc false
  def validate(question, attrs) do
    question
    |> cast(attrs, [:valid])
    |> validate_required([:valid])
  end
end
