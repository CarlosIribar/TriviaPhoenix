defmodule TriviaWeb.QuestionController do
  use TriviaWeb, :controller

  alias Trivia.QuestionGame
  alias Trivia.QuestionGame.Question

  def index(conn, _params) do
    questions = QuestionGame.list_questions()
    render(conn, "index.html", questions: questions)
  end

  def new(conn, _params) do
    changeset = QuestionGame.change_question(%Question{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"question" => question_params}) do
    case QuestionGame.create_question(question_params) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Question created successfully.")
        |> redirect_after_creation(question)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    question = QuestionGame.get_question!(id)
    render(conn, "show.html", question: question)
  end

  def edit(conn, %{"id" => id}) do
    question = QuestionGame.get_question!(id)
    changeset = QuestionGame.change_question(question)
    render(conn, "edit.html", question: question, changeset: changeset)
  end

  def update(conn, %{"id" => id, "question" => question_params}) do
    question = QuestionGame.get_question!(id)

    case QuestionGame.update_question(question, question_params) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Question updated successfully.")
        |> redirect(to: Routes.question_path(conn, :show, question))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", question: question, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    question = QuestionGame.get_question!(id)
    {:ok, _question} = QuestionGame.delete_question(question)

    conn
    |> put_flash(:info, "Question deleted successfully.")
    |> redirect(to: Routes.question_path(conn, :index))
  end

  def validate(conn, %{"id" => id}) do
    question = QuestionGame.get_question!(id)

    case QuestionGame.validate_question(question) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Question validated successfully.")
        |> redirect(to: Routes.question_path(conn, :index))

      {:error, _} ->
        conn
        |> put_flash(:info, "There was an issue")
    end
  end

  defp redirect_after_creation(%Plug.Conn{assigns: %{current_user: nil}} = conn, _question) do
    redirect(conn, to: Routes.page_path(conn, :index))
  end

  defp redirect_after_creation(%Plug.Conn{assigns: %{current_user: _}} = conn, question) do
    redirect(conn, to: Routes.question_path(conn, :show, question))
  end
end
