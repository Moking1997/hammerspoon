local obj={}
obj.__index = obj

-- Metadata
obj.name = "Clipboard"
obj.version = "1.0"
obj.author = "Moking1997 <Moking1997@icloud.com>"
obj.homepage = "https://github.com/Moking1997/hammerspoon"
obj.license = "MIT - https://opensource.org/licenses/MIT"

-- base settings
obj.history = {}
obj.frequency = 0.8
obj.lastChange = hs.pasteboard.changeCount()
obj.lastText = nil
obj.maxSize = 12

-- global watcher
ClipboardWatcher = nil

-- init
function obj:init()
    obj.clipboard = hs.chooser.new(function (choice)
        if choice then
            hs.pasteboard.setContents(choice.content)
            hs.eventtap.keyStroke({ "cmd" }, "v")
        end
    end)
    obj.clipboard:rows(obj.maxSize)
    obj:clipboardTimer()
end


function obj:pushData()
    local contentTypes = hs.pasteboard.contentTypes()
    local item = {}
    local text = hs.pasteboard.readString()

    if text ~= obj.lastText then
        local isText = false
        for _, uti in ipairs(contentTypes) do
            if uti == "public.utf8-plain-text" then
                item.text = string.gsub(text, "[\r\n]+", " ")
                item.content = text;
                obj.lastText = text
                isText = true
                break
            end
        end
        if not isText then
            return;
        end
        table.insert(obj.history , 1, item)
        while (#obj.history >= obj.maxSize) do
            table.remove(obj.history,obj.maxSize)
        end
    end
   
end

local function watchClipboard()
    local now = hs.pasteboard.changeCount()
    if now ~=obj.lastChange then
        obj:pushData()
        obj.lastChange = now
    end
end

function obj:clipboardTimer()
    ClipboardWatcher = hs.timer.new(obj.frequency, watchClipboard)
    ClipboardWatcher:start()
end

---
--- toggleShow()
---

function obj:toggleShow()
    if obj.clipboard:isVisible() then
        obj.clipboard:hide()
    else
        obj.clipboard:choices(obj.history)
        obj.clipboard:show()
    end
end


return obj
