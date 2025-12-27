defmodule TicTacToeWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TicTacToeWeb do
    pipe_through :api

    get "/new", GameController, :new
    post "/move", GameController, :move
    post "/computer", GameController, :computer_move
  end
end
