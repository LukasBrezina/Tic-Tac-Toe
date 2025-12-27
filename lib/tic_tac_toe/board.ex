defmodule TicTacToe.Board do
  def new, do: List.duplicate(nil, 9)

  def move(board, position, player) do
    case Enum.at(board, position) do
      nil -> List.replace_at(board, position, player)
      _ -> {:error, :occupied}
    end
  end

  def to_map(board) do
    Enum.with_index(board)
    |> Enum.map(fn
      {nil, i} -> {Integer.to_string(i), nil}
      {player, i} -> {Integer.to_string(i), player}
    end)
    |> Map.new()
  end
end
