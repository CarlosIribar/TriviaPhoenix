# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Trivia.Repo.insert!(%Trivia.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Trivia.QuestionGame.Question
alias Trivia.Repo

Repo.delete_all(Question)

Repo.insert!(%Question{
  question: "Some Questions",
  answer: 1,
  answer1: "A",
  answer2: "B",
  answer3: "C",
  answer4: "D",
  creator: "Some User"
})
