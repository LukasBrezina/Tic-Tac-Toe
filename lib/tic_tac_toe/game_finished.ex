defmodule TicTacToe.GameFinished do
  @wins [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def winner(board) do
    Enum.find_value(@wins, fn [a, b, c] ->
      case {Enum.at(board, a), Enum.at(board, b), Enum.at(board, c)} do
        {p, p, p} when p != nil -> p
        _ -> nil
      end
    end)
  end

  def draw?(board) do
    nil not in board and winner(board) == nil
  end
end
