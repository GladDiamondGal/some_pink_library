---@class SmallBullet : Bullet
local SmallBullet, super = Class(Bullet)

---@param x number # The X position of the bullet
---@param y number # The Y position of the bullet
---@param dir number # The dir (in radians) of the bullet
---@param speed number # The speed the bullet will move at in the specified direction
function SmallBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y)

    self.dummy = Sprite("party/pink/bullets/dummy")
    self.dummy:setOrigin(0.5, 0.5)
    self.dummy:setScale(0.5)
    self.dummy.y = -10
    self.start = -10
    self.dummy:setColor(0.5, 0.5, 0.5)
    
    self:addChild(self.dummy)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    --self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    --self.physics.speed = speed

    self.rot = math.random(1, 30)
    self.rott = 0

end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    self.rot = self.rot + (DTMULT/5)
    self.start = self.start + DT * 15

    local sin = math.sin(self.rot) * 5

    if sin > 0 then
        self.dummy.y = sin - math.min(8, self.start)
    else
        self.dummy.y = -sin - math.min(8, self.start)
    end

    self.dummy.rotation = (math.sin(self.rot)/1.5)

    if math.min(8, self.start) == 8 and not self.shot then
        self.shot = true


            -- Get the attacker's center position
            local x, y = self.x, self.y

            -- Get the angle between the bullet position and the soul's position
            local angle = MathUtils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

            -- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/smallbullet.lua)
            local bullet = self.wave:spawnBullet("smallbullet", x, y, angle, 8)

            bullet:setColor(0, 1, 0)
            function bullet:onDamage(soul)

                local heal = 5
                local num = math.random(#Game.battle.party)
                local target = Game.battle.party[num]
                local battlers = target:heal(heal)
                return {}
            end
        


    end

    super.update(self)
end

function SmallBullet:draw()

    love.graphics.setScissor(0, 0, 640, 325)

    super.draw(self)
    love.graphics.setScissor()
end

return SmallBullet
