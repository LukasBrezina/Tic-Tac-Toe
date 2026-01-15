# TicTacToe

## Get Dependencies
mix deps.get

## Start Application
mix phx.server

## Endpoints

GET http://localhost:4000/api/new -> create new Game

POST http://localhost:4000/api/move -> make move (body = "board" : {board from last response}, "position" : {where to move}
