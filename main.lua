-- CHESS BOARD! (for windows)
-- Import piece loader
local pieceLoader = require("pieceLoader")
-- Table to store chess pieces
local chessPieces = {}
local selectedPiece = nil
local crosshairSize = 10 -- Set crosshair size

function love.load()
	love.window.setTitle("Chess")
	love.window.setMode(750, 750)
    squareSize = 60
    boardSize = squareSize * 8
    offsetX = (love.graphics.getWidth() - boardSize) / 2
    offsetY = (love.graphics.getHeight() - boardSize) / 2
    files = {"A", "B", "C", "D", "E", "F", "G", "H"}
    reverseFiles = {"H", "G", "F", "E", "D", "C", "B", "A"}
    ranks = {"8", "7", "6", "5", "4", "3", "2", "1"}
    resetButton = {x = 10, y = 30, width = 75, height = 50}
    buttonLabelOffset = 18
    love.graphics.setBackgroundColor(0.3, 0.3, 0.3)
    love.mouse.setVisible(false)
    chessPieces = pieceLoader.loadPieces()
end

function love.draw()
    --region Draw Reset Button
    love.graphics.setColor(0, 1, 0) -- green
    love.graphics.rectangle("fill", resetButton.x, resetButton.y, resetButton.width, resetButton.height)
    love.graphics.setColor(0, 0, 0) -- black
    love.graphics.print("RESET", resetButton.x + buttonLabelOffset, resetButton.y + buttonLabelOffset)
    --endregion

    --region Get current mouse position
    local mouseX, mouseY = love.mouse.getPosition()
    --endregion

    --region Draw the white border
    love.graphics.setColor(1, 1, 1) --white
    love.graphics.rectangle("fill", offsetX - 1, offsetY - 1, boardSize + 2, boardSize + 2)
    --endregion

    --region Draw Chess board
    drawChessBoard()
    --endregion

    --region Draw labels
    love.graphics.setColor(1, 1, 1) -- White
    -- file labels
    drawFileLabels(false) -- default false for now until 'Flip Board' button is added
    -- rank labels
    drawRankLabels(false)
    --endregion

    --region Draw Chess Pieces, must draw them after the board, but before the crosshair
    for _, chessPiece in ipairs(chessPieces) do
        love.graphics.draw(chessPiece.icon, chessPiece.x, chessPiece.y)
    end
    --endregion

    --region Draw Crosshair
    love.graphics.setColor(1, 0, 0) -- Red
    -- Draw the horizontal line of the crosshair
    love.graphics.line(mouseX - crosshairSize, mouseY, mouseX + crosshairSize, mouseY)
    -- Draw the vertical line of the crosshair
    love.graphics.line(mouseX, mouseY - crosshairSize, mouseX, mouseY + crosshairSize)
    --endregion
end

function love.update(dt)
    if selectedPiece then
        -- Update the position of the selected piece to follow the mouse
        local mouseX, mouseY = love.mouse.getPosition()
        selectedPiece.x = mouseX - selectedPiece.width / 2
        selectedPiece.y = mouseY - selectedPiece.height / 2
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then -- Left mouse button
        if resetButtonOnCLick(x, y) then
            chessPieces = pieceLoader.loadPieces()
        end
        for _, chessPiece in ipairs(chessPieces) do
            if x > chessPiece.x and x < chessPiece.x + chessPiece.width and
                    y > chessPiece.y and y < chessPiece.y + chessPiece.height then
                selectedPiece = chessPiece
                break
            end
        end
    end
end

function resetButtonOnCLick(x, y)
    if x > resetButton.x and x < (resetButton.x + resetButton.width) and
            y > resetButton.y and y < (resetButton.y + resetButton.height) then
        return true
    end
end

function love.mousereleased(x, y, button)
    if button == 1 then -- Left mouse button
        selectedPiece = nil
    end
end

function drawChessBoard()
    for row = 1, 8 do
        for col = 1, 8 do
            local x = offsetX + (col - 1) * squareSize
            local y = offsetY + (row - 1) * squareSize

            if (row + col) % 2 == 0 then
                love.graphics.setColor(.9, .9, .7) --off-white
            else
                love.graphics.setColor(0, .5, 0) --dark-green
            end

            -- Draw the square
            love.graphics.rectangle("fill", x, y, squareSize, squareSize)
        end
    end
end

function drawFileLabels(reverse)
    for col = 1, 8 do
        local x = (offsetX - 10) + (col - 1) * squareSize + squareSize / 2
        local y = offsetY + boardSize + 10
        if (reverse) then
            love.graphics.printf(reverseFiles[col], x, y, 20, "center")
        else
            love.graphics.printf(files[col], x, y, 20, "center")
        end
    end
end

function drawRankLabels(reverse)
    for row = 1, 8 do
        local x = offsetX - 25
        local y = offsetY + (row - 1) * squareSize + squareSize / 2 - 5
        if (reverse) then
            love.graphics.printf(row, x, y, 20, "center")
        else
            love.graphics.printf(ranks[row], x, y, 20, "center")
        end
    end
end