defmodule TicTacToeWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :tic_tac_toe

  plug Plug.RequestId
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Jason

  plug TicTacToeWeb.Router
end
