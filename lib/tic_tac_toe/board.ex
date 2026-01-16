defmodule TicTacToe.Board do
  @moduledoc """
  Module for managing the Tic Tac Toe board.
  The board is represented as a list of 9 elements, where each element can be:
  - `:x` for player X (human)
  - `:o` for player O (computer)
  - `nil` for an empty place
  """
  def new, do: List.duplicate(nil, 9)

  def move(board, position, player) do
    case Enum.at(board, position) do
      nil -> List.replace_at(board, position, player)
      _ -> {:error, :occupied}
    end
  end

  # convert board to map
  def to_map(board) do
    Enum.with_index(board)
    |> Enum.map(fn
      {nil, i} -> {Integer.to_string(i), nil}
      {player, i} -> {Integer.to_string(i), player}
    end)
    |> Map.new()
  end
end
