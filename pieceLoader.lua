-- Piece Loader for CHESS BOARD! (for windows)
local pieceLoader = {}
local RANK_EIGHT_Y_COORD = 135
local RANK_SEVEN_Y_COORD = 195
local RANK_TWO_Y_COORD = 495
local RANK_ONE_Y_COORD = 555
local START_X_COORD = 135

function pieceLoader.loadPieces()
    blackBishop = love.graphics.newImage("bdt60.png")
    whiteBishop = love.graphics.newImage("blt60.png")
    blackKnight = love.graphics.newImage("ndt60.png")
    whiteKnight = love.graphics.newImage("nlt60.png")
    blackRook = love.graphics.newImage("rdt60.png")
    whiteRook = love.graphics.newImage("rlt60.png")
    blackPawn = love.graphics.newImage("pdt60.png")
    whitePawn = love.graphics.newImage("plt60.png")
    pieces = {
        --- Black Pieces
        {
            icon = blackRook,
            x = START_X_COORD,
            y = RANK_EIGHT_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = blackKnight,
            x = 195,
            y = RANK_EIGHT_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = blackBishop,
            x = 255,
            y = RANK_EIGHT_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = love.graphics.newImage("qdt60.png"),
            x = 315,
            y = RANK_EIGHT_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = love.graphics.newImage("kdt60.png"),
            x = 375,
            y = RANK_EIGHT_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = blackBishop,
            x = 435,
            y = RANK_EIGHT_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = blackKnight,
            x = 495,
            y = RANK_EIGHT_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = blackRook,
            x = 555,
            y = RANK_EIGHT_Y_COORD,
            width = 50,
            height = 50
        },
        --- white pieces
        {
            icon = whiteRook,
            x = START_X_COORD,
            y = RANK_ONE_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = whiteKnight,
            x = 195,
            y = RANK_ONE_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = whiteBishop,
            x = 255,
            y = RANK_ONE_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = love.graphics.newImage("qlt60.png"),
            x = 315,
            y = RANK_ONE_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = love.graphics.newImage("klt60.png"),
            x = 375,
            y = RANK_ONE_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = whiteBishop,
            x = 435,
            y = RANK_ONE_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = whiteKnight,
            x = 495,
            y = RANK_ONE_Y_COORD,
            width = 50,
            height = 50
        },
        {
            icon = whiteRook,
            x = 555,
            y = RANK_ONE_Y_COORD,
            width = 50,
            height = 50
        }
    }
    loadPawns(blackPawn, RANK_SEVEN_Y_COORD)
    loadPawns(whitePawn, RANK_TWO_Y_COORD)

    return pieces
end

function loadPawns(icon, y)
    start = START_X_COORD
    for i = 1, 8 do
        table.insert(pieces, {
            icon = icon,
            x = start,
            y = y,
            width = 50,
            height = 50
        })
        start = start + 60
    end
end

return pieceLoader