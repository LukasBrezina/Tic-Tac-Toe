defmodule TicTacToeWeb.Router do
  @moduledoc """
  The router for the Tic Tac Toe web application.
  It defines the API endpoints for starting a new game and making moves.
  """
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TicTacToeWeb do
    pipe_through :api
    get "/new", GameController, :new
    post "/move", GameController, :move
  end
end
