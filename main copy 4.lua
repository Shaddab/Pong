WINDOW_WIDTH = 600
WINDOW_HEIGHT = 600

Class = require 'class'
require 'Ball'
require 'Paddle'
require 'Player2Y'

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    ball = Ball(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2, 15, 15)


    ballDX = math.random(2) == 1 and 100 or -100
    ballDY = math.random(-50, 50)

    player1 = Paddle(10, 200, 10, 200)
    player2Y = Player2Y(WINDOW_WIDTH - 20, WINDOW_HEIGHT - 50, 10, 50)
    SPEED = 200

    gameState = 'start'
    ball = Ball(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2, 15, 15) 
end

function love.update(dt)
    player2Y:update(dt)
   
    

    if gameState == 'play' then
        ball:update(dt)

        player1:update(dt)

        if player1.y <= WINDOW_HEIGHT / 2 then
            player1.y = player1.y + ball.x * dt
        end

        if player1.y >= WINDOW_HEIGHT / 2 then
            player1.y = player1.y + ball.y * dt
        end
        

        if player1.y >= WINDOW_HEIGHT -200 then
            player1.y = WINDOW_HEIGHT - 200
            player1.dy = -player1.dy
        end

        if player1.y <= 0 then
            player1.y = 0
            player1.dy = -player1.dy
        end

        if ball:collides(player1) then
            ball.dx = -ball.dx * 1.07
            ball.x = player1.x + 16

            if ball.dy < 0 then
                ball.dy = -math.random(10, 150)
            else
                ball.dy = math.random(10, 150)
            end
        end

        if ball:collides(player2Y) then
            ball.dx = -ball.dx * 1.07
            ball.x = player2Y.x - 15

            if ball.dy < 0 then
                ball.dy = -math.random(10, 150)
            else
                ball.dy = math.random(10, 150)
            end
        end

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
    player1:render()
    player2Y:render()

   
end