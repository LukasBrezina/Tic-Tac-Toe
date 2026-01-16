# TicTacToe

## Get Dependencies
mix deps.get

----------------

## Start Application
mix phx.server

----------------

## GET http://localhost:4000/api/new 

### Response
Empty board
```json
{
  "board": {
    "0": null,
    "1": null,
    "2": null,
    "3": null,
    "4": null,
    "5": null,
    "6": null,
    "7": null,
    "8": null
  }
}
```

----------------
## POST http://localhost:4000/api/move 
### RequestBody
last seen Board + Field where you want to place X

```json
{
  "position": "4",
  "board": {
    "0": null,
    "1": null,
    "2": null,
    "3": null,
    "4": null,
    "5": null,
    "6": null,
    "7": null,
    "8": null
  }
}
```

### Respones:
#### Move ok
```json
{
  "status": "ok",
  "board": {
    "0": "x",
    "1": "o",
    "2": null,
    "3": null,
    "4": "x",
    "5": null,
    "6": "o",
    "7": null,
    "8": null
  }
}
```
#### X/O won
```json
{
  "status": "finished",
  "message": "X/O wins",
  "winner": "x/o",
  "board": {
    "0": "x",
    "1": "x",
    "2": "x",
    "3": "o",
    "4": "o",
    "5": null,
    "6": null,
    "7": null,
    "8": null
  }
}
```
#### Draw
```json
{
  "status": "finished",
  "message": "Draw",
  "winner": "draw",
  "board": {
    "0": "x",
    "1": "o",
    "2": "x",
    "3": "o",
    "4": "o",
    "5": "x",
    "6": "x",
    "7": "x",
    "8": "o"
  }
}
```

#### Error
```json
{
  "status": "error",
  "reason": "occupied",
  "board": {
    "0": "x",
    "1": "o",
    "2": null,
    "3": null,
    "4": "x",
    "5": null,
    "6": null,
    "7": null,
    "8": null
  }
}
```



