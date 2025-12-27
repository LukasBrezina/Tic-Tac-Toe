import Config

config :tic_tac_toe, TicTacToeWeb.Endpoint,
  url: [host: "localhost"],
  http: [port: 4000],
  debug_errors: true,
  code_reloader: false,
  check_origin: false,
  watchers: []
