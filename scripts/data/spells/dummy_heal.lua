local spell, super = Class(Spell, "dummy_heal")

function spell:init()
    super.init(self)
    self.name = "Dummy Heal"
    self.cast_name = nil
    self.effect = "Heals over\ntime"
    self.description = "Allan please add description."
    self.check = "Allan please add check."

    self.cost = 0
    self.target = "none"
    self.tags = {"heal"}
end

function spell:onCast(user, target)
    local object = healing_dummy(user, target)
        Game.battle:addChild(object)
    return true
end

function spell:getDamage(user, target)
    return 0 
end

return spell