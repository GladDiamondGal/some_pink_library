---@class Textbox : Textbox
local Textbox, super = HookSystem.hookScript(Textbox)

function Textbox:init(x, y, width, height, default_font, default_font_size, battle_box)
    super.init(self, x, y, width, height, default_font, default_font_size, battle_box)

    self.text:registerCommand("sweat", function(text, node, dry)
        local sweat = Sprite("face/pink/sweatdrop/sweatdrop", self.face.x, self.face.y)
        sweat:setScale(2)
        sweat:play(0.1, false)
        sweat.layer = self.face.layer + 0.01
        self:addChild(sweat)
    end)
end

function Textbox:setText(text, callback)
    super.setText(self, text, callback)

    if self.actor and self.actor.id == "pink" then
        self.text.x = 2

        local tail_uses = {"wink", "concerned", "talk", "happy"}
        local tex = self.face.texture_path


        for i, name in ipairs(tail_uses) do

            if tex == "face/pink/".. name .."_1" then
                local tail = Sprite("face/pink/tail/tail", self.face.x, self.face.y)
                tail:setScale(2)
                tail:play(0.2)
                tail.layer = self.face.layer - 0.01
                self:addChild(tail)
            end
        end

        if tex == [[face/pink/shocked_1]] then
            self.face.x = 312
            self.face.y = -124
        end

    end

end

return Textbox
