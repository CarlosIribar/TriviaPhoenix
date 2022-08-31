defmodule Trivia.QuestionGameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Trivia.QuestionGame` context.
  """

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{
        anwser: 42,
        creator: "some creator",
        question1: "some question1",
        question2: "some question2",
        question3: "some question3",
        question4: "some question4",
        valid: true
      })
      |> Trivia.QuestionGame.create_question()

    question
  end
end
