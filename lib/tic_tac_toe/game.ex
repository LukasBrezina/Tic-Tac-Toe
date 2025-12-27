defmodule TicTacToe.Game do
  alias TicTacToe.{Board, Computer, GameFinished}

  def make_move(board, position, :x) do
    case Board.move(board, position, :x) do
      {:error, :occupied} -> {:error, :occupied, board}
      new_board -> check_game(new_board)
    end
  end

  def make_move(board, :o) do
    new_board = Computer.move(board)
    check_game(new_board)
  end

  defp check_game(board) do
    cond do
      GameFinished.winner(board) == :x -> {:finished, :x, board}
      GameFinished.winner(board) == :o -> {:finished, :o, board}
      GameFinished.draw?(board) -> {:finished, :draw, board}
      true -> {:ok, board}
    end
  end
end
