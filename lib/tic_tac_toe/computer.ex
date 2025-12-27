defmodule TicTacToe.Computer do
  alias TicTacToe.Board

  def move(board) do
    empty =
      board
      |> Enum.with_index()
      |> Enum.filter(fn {v, _} -> v == nil end)
      |> Enum.map(fn {_, i} -> i end)

    pos = Enum.random(empty)
    Board.move(board, pos, :o)
  end
end
