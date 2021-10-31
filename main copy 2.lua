WINDOW_WIDTH = 600
WINDOW_HEIGHT = 600

Class = require 'class'
require 'Ball'

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

    player1Y = 20
    SPEED = 200

    gameState = 'start'
    ball = Ball(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2, 15, 15) 
end

function love.update(dt)
    if love.keyboard.isDown('w') then
        player1Y = math.max(0, player1Y + -SPEED * dt)
    elseif love.keyboard.isDown ('s') then
        player1Y = math.min(WINDOW_HEIGHT - 50, player1Y + SPEED * dt)
    end

    if gameState == 'play' then
        ball:update(dt)

        if ball.y <= 0 then
            ball.y = 0
            ball.dy = -ball.dy
        end

        if  ball.y >= WINDOW_HEIGHT - 15 then
            ball.y = WINDOW_HEIGHT - 15
            ball.dy = -ball.dy
        end

        if ball.x <= 0 then
            ball.x = 0
            ball.dx = -ball.dx 
        end

        if ball.x >= WINDOW_WIDTH - 15 then
            ball.x = WINDOW_WIDTH - 15
            ball.dx = -ball.dx 
        end
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            ball:reset()
        end
    end
end


function love.draw()
    ball:render()
    love.graphics.rectangle('fill', 10, player1Y, 10, 50)
end