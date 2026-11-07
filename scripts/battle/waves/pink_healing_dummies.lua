local Aiming, super = Class(Wave)

function Aiming:onStart()
    -- Every 0.5 seconds...

            local bullet = self:spawnBullet("pink_heal_heart", 320, 320)
            bullet.wave = self

            local bullet = self:spawnBullet("pink_heal_heart", 300, 320)
            bullet.wave = self


            local bullet = self:spawnBullet("pink_heal_heart", 340, 320)
            bullet.wave = self
--[[
            bullet:setColor(0, 1, 0)
            function bullet:onDamage(soul)

                local heal = 5
                local num = math.random(#Game.battle.party)
                local target = Game.battle.party[num]
                local battlers = target:heal(heal)
                return {}
            end]]

end

function Aiming:update()
    -- Code here gets called every frame

    super.update(self)
end

return Aiming
