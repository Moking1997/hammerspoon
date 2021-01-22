local obj={}
obj.__index = obj

-- Metadata
obj.name = "AClock"
obj.version = "1.0"
obj.author = "Moking1997 <Moking1997@icloud.com>"
obj.homepage = "https://github.com/Moking1997/hammerspoon"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()
    obj.canvas = hs.canvas.new({x=0, y=0, w=0, h=0}):show()
    obj.canvas[1] = {
        type = "rectangle",
        action = "fill",
        fillColor = {hex="#000000", alpha=0.75}
    }
    obj.canvas[2] = {
        type = "text",
        text = "",
        textSize = 120,
        textAlignment = "center",
    }
    
end

--- 
--- AClock:toggleShow()
---

function obj:toggleShow()
    if obj.timer then
        obj.timer:stop()
        obj.timer = nil
        obj.canvas:hide()
    else
        local time = os.date("%H:%M\n%A\n%Y-%m-%d")
        local cscreen = hs.screen.mainScreen()
        local cres = cscreen:fullFrame()
        obj.canvas:frame({
            x = cres.x+cres.w*0.15/2,
            y = cres.y+cres.h*0.30/2,
            w = cres.w*0.85,
            h = cres.h*0.70
        })
        obj.canvas[2].text = time
        obj.canvas:show()
        obj.timer = hs.timer.doAfter(4, function()
            obj.canvas:hide()
            obj.timer = nil
        end)
    end
end

return obj
