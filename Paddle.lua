Paddle = Class{}

function Paddle:init(x, y, width, height) 
    self.x = x
    self.y = y
    self.width = width 
    self.height = height
    self.dy = 0 
   
    --self.dx = math.random(2) == 1 and 100 or -100
    self.dy = math.random(2) == 1 and 100 or -100
end

function Paddle:update(dt)
    --self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Paddle:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end    