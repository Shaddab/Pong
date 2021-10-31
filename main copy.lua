Class = require 'class'

require 'Ball'

WINDOW_WIDTH = 600
WINDOW_HEIGHT = 600


function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    ballX = WINDOW_WIDTH / 2
    ballY = WINDOW_HEIGHT / 2

    ballDX = math.random(2) == 1 and 100 or -100
    ballDY = math.random(-50, 50)

    gameState = 'start'
end

function love.update(dt)
    if gameState == 'play' then
        ballX = ballX + ballDX * dt
        ballY = ballY + ballDY * dt
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'

            ballX = WINDOW_WIDTH / 2
            ballY = WINDOW_HEIGHT / 2

            ballDX = math.random(2) == 1 and 100 or -100
            ballDY = math.random(-50, 50) * 1.5
        end
    end
end


function love.draw()
    love.graphics.rectangle('fill', ballX, ballY, 15, 15)
end