---@class healing_dummy : Object
---@overload fun(...) : healing_dummy
local healing_dummy, super = Class(Object)

function healing_dummy:init(user, target)
    super.init(self, 0, 0)
    self.caster = user
end

function healing_dummy:waveStart()
    if not self.started then
        self.started = true


        local wave = Registry.createWave("pink_healing_dummies")

        wave.encounter = Game.battle.encounter
        Game.battle:addChild(wave)
        table.insert(Game.battle.waves, wave)
        wave.active = true
        wave:onStart()



    end
end

function healing_dummy:update()
    super.update(self)

    if Game.battle.state == "DEFENDING" then
        self:waveStart()
    elseif Game.battle.state == "ACTIONSELECT" then
        self:remove()
    end

end

function healing_dummy:draw()
    super.draw(self)
end

return healing_dummy