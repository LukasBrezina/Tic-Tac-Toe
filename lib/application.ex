defmodule TicTacToe.Application do
  use Application

  def start(_type, _args) do
    children = [
      # Start PubSub
      {Phoenix.PubSub, name: TicTacToe.PubSub},
      # Start Endpoint
      TicTacToeWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: TicTacToe.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
