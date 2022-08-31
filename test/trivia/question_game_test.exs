defmodule Trivia.QuestionGameTest do
  use Trivia.DataCase

  alias Trivia.QuestionGame

  describe "questions" do
    alias Trivia.QuestionGame.Question

    import Trivia.QuestionGameFixtures

    @invalid_attrs %{
      anwser: nil,
      creator: nil,
      question1: nil,
      question2: nil,
      question3: nil,
      question4: nil,
      valid: nil
    }

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert QuestionGame.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert QuestionGame.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      valid_attrs = %{
        anwser: 42,
        creator: "some creator",
        question1: "some question1",
        question2: "some question2",
        question3: "some question3",
        question4: "some question4",
        valid: true
      }

      assert {:ok, %Question{} = question} = QuestionGame.create_question(valid_attrs)
      assert question.anwser == 42
      assert question.creator == "some creator"
      assert question.question1 == "some question1"
      assert question.question2 == "some question2"
      assert question.question3 == "some question3"
      assert question.question4 == "some question4"
      assert question.valid == true
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = QuestionGame.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()

      update_attrs = %{
        anwser: 43,
        creator: "some updated creator",
        question1: "some updated question1",
        question2: "some updated question2",
        question3: "some updated question3",
        question4: "some updated question4",
        valid: false
      }

      assert {:ok, %Question{} = question} = QuestionGame.update_question(question, update_attrs)
      assert question.anwser == 43
      assert question.creator == "some updated creator"
      assert question.question1 == "some updated question1"
      assert question.question2 == "some updated question2"
      assert question.question3 == "some updated question3"
      assert question.question4 == "some updated question4"
      assert question.valid == false
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = QuestionGame.update_question(question, @invalid_attrs)
      assert question == QuestionGame.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = QuestionGame.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> QuestionGame.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = QuestionGame.change_question(question)
    end
  end
end
