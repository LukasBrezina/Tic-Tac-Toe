defmodule TicTacToeWeb.GameController do
  use Phoenix.Controller
  alias TicTacToe.{Board, Game}

  def new(conn, _params) do
    board = Board.new()
    json(conn, %{board: Board.to_map(board)})
  end

  def move(conn, %{"position" => pos}) do
    board = conn.body_params["board"] || Board.new()
    position = String.to_integer(pos)

    case Game.make_move(board, position, :x) do
      {:ok, new_board} ->
        json(conn, %{status: "ok", board: Board.to_map(new_board)})

      {:error, :occupied, board} ->
        json(conn, %{status: "error", reason: "occupied", board: Board.to_map(board)})

      {:finished, winner, new_board} ->
        json(conn, %{status: "finished", winner: winner, board: Board.to_map(new_board)})
    end
  end

  def computer_move(conn, _params) do
    board = conn.body_params["board"] || Board.new()

    case Game.make_move(board, :o) do
      {:ok, new_board} ->
        json(conn, %{status: "ok", board: Board.to_map(new_board)})

      {:finished, winner, new_board} ->
        json(conn, %{status: "finished", winner: winner, board: Board.to_map(new_board)})
    end
  end
end
