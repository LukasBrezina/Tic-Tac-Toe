defmodule TicTacToeWeb.Endpoint do
  @moduledoc """
  The Phoenix endpoint for the Tic Tac Toe application.
  It handles incoming HTTP requests and routes them to the appropriate controllers.
  """
  use Phoenix.Endpoint, otp_app: :tic_tac_toe

  plug Plug.RequestId
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Jason

  plug TicTacToeWeb.Router
end
