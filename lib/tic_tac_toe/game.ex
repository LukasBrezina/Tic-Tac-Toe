defmodule TicTacToe.Game do
  alias TicTacToe.{Board, Computer, GameFinished}
  @moduledoc """
  Module for managing the game logic of Tic Tac Toe.
  It handles player moves, checks for game completion (win/draw), and interacts with the computer player.
  """

  def make_move_player(board, position, :x) do
    # check win conditions before move
    case GameFinished.winner(board) do
      :x -> {:finished, :x, board}
      :o -> {:finished, :o, board}
      nil ->
        if GameFinished.draw?(board) do
          {:finished, :draw, board}
        else
          case Board.move(board, position, :x) do
            {:error, :occupied} -> {:error, :occupied, board}
            new_board -> check_game(new_board)
          end
        end
    end
  end

  def make_move_computer(board, :o) do
    # check win conditions before move
    case GameFinished.winner(board) do
      :x -> {:finished, :x, board}
      :o -> {:finished, :o, board}
      nil ->
        if GameFinished.draw?(board) do
          {:finished, :draw, board}
        else
          new_board = Computer.move(board)
          check_game(new_board)
        end
    end
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
