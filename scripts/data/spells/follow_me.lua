local spell, super = Class(Spell, "follow_me")

function spell:init()
    super.init(self)
    self.name = "Follow Me!"
    self.cast_name = "Follow Me!\n* All enemies will target Pink this turn."
    self.effect = "Distract\nEnemy"
    self.description = "Allan please add description."
    self.check = "Allan please add check."

    self.cost = 0
    self.target = "enemies"
    self.tags = {"target"}
end

function spell:onCast(user, target)
    Game.battle.follow_me = user
        Game.battle.follow_me.targeted = true

    return true
end

function spell:getDamage(user, target)
    return 0 
end

return spell