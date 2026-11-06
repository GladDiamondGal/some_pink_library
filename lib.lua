local lib = {}

function lib:onActionSelect(battler, button)

    local sel = Game.battle.current_selecting or 1

    local bat = Game.battle.party[sel]

    if button.type == "defend" and bat.chara.id == "pink" then
        bat.chara.add_doki = math.min(bat.chara.add_doki + 3.2, 20)
    end
end


function lib:init()
    Utils.hook(Battle, "commitSingleAction", function(orig, self, action)
        if action.doki then
            if action.tp > 0 then
                Game:giveDoki(action.doki)
            elseif action.doki < 0 then
                Game:removeDoki(-action.doki)
            end
        end
        orig(self, action)
    end)
end


return lib