defmodule TicTacToeWeb.GameController do
  use Phoenix.Controller
  alias TicTacToe.{Board, Game}
  @moduledoc """
  Controller for handling Tic Tac Toe game API requests.
  """

  def new(conn, _params) do
    board = Board.new()
    json(conn, %{board: Board.to_map(board)})
  end

  def move(conn, %{"position" => pos, "board" => board_map}) do
    board = map_to_list(board_map)
    position = String.to_integer(pos)
    case Game.make_move_player(board, position, :x) do
      {:ok, board_after_x} ->
        case Game.make_move_computer(board_after_x, :o) do
          {:ok, board_after_o} ->
            json(conn, %{status: "ok", board: Board.to_map(board_after_o)})

          {:finished, winner, board_after_o} ->
            json(conn, %{status: "finished", message: winner_message(winner), winner: winner, board: Board.to_map(board_after_o)})
        end

      {:error, :occupied, board} ->
        json(conn, %{status: "error", reason: "occupied", board: Board.to_map(board)})

      {:finished, winner, board_after_x} ->
        json(conn, %{status: "finished", message: winner_message(winner), winner: winner, board: Board.to_map(board_after_x)})
    end
  end

  defp map_to_list(board_map) do
    0..8
    |> Enum.map(fn i ->
      case Map.get(board_map, Integer.to_string(i)) do
        nil -> nil
        value when is_binary(value) ->
          case String.downcase(value) do
            "x" -> :x
            "o" -> :o
            _ -> nil
          end

        value when is_atom(value) -> value
        _ -> raise "Invalid value in board_map"
      end
    end)
  end

  defp winner_message(:x), do: "X hat gewonnen"
  defp winner_message(:o), do: "O hat gewonnen"
  defp winner_message(:draw), do: "Unentschieden"
end
