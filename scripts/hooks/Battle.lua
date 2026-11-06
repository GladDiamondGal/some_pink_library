---@class Battle : Battle
local Battle, super = HookSystem.hookScript(Battle)

function Battle:postInit(state, encounter)
    super.postInit(self, state, encounter)

    if Game:hasPartyMember("pink") then

        self.doki_bar = dokibar(-25, 40, true)
        self:addChild(self.doki_bar)
    end

end


--- Removes a single action from the list of actions.
function Battle:removeSingleAction(action, from_defeat)

        -- Reverse any DOKI changes
        if action.doki then
            if action.doki < 0 then
                Game:giveTension(-action.doki)
            elseif action.doki > 0 then
                Game:removeTension(action.doki)
            end
        end

    super.removeSingleAction(self, action, from_defeat)
end

function Battle:randomTarget()
    -- This is "scr_randomtarget".

    if Game.battle.follow_me and Game.battle.follow_me.targeted == true then 
        Game.battle.follow_me.targeted = true
        return Game.battle.follow_me
    end

    local target = self:randomTargetOld()

    if (not Game:getConfig("targetSystem")) and (target ~= "ALL") then
        return self:targetAny()
    end

    return target
end

return Battle
