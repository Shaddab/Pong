Player2Y = Class{}

function Player2Y:init(x, y, width, height)
    self.x = x
    self.y = y 
    self.width = width 
    self.height = height

    SPEED = 200
end

function Player2Y:update(dt)
    if love.keyboard.isDown('up') then
        self.y = math.max(0, self.y + -SPEED * dt)
    elseif love.keyboard.isDown('down') then
        self.y = math.min(WINDOW_HEIGHT - self.height, self.y + SPEED * dt)
    end 
end

function Player2Y:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end