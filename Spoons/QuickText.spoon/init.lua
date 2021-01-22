local obj={}
obj.__index = obj

-- Metadata
obj.name = "QuickText"
obj.version = "1.0"
obj.author = "Moking1997 <Moking1997@icloud.com>"
obj.homepage = "https://github.com/Moking1997/hammerspoon"
obj.license = "MIT - https://opensource.org/licenses/MIT" 

if not QuickText_list then
    QuickText_list = {
        -- open url
        ["o1"] =
        {
            ["type"] = "url",
            ["url"] = "https://www.hammerspoon.org/",
        },
        ["o2"] =
        {
            ["type"] = "url",
            ["url"] = "https://www.v2ex.com/",
        },
        ["o3"] =
        {
            ["type"] = "url",
            ["url"] = "https://github.com/",
        },
        -- search text
        ["g"] =
        {
            ["type"] = "search",
            ["text"] = "https://www.google.com/search?q=",
        },
        ["bd"] =
        {
            ["type"] = "search",
            ["text"] = "https://www.baidu.com/s?wd=",
        },
        ["hub"] =
        {
            ["type"] = "search",
            ["text"] = "https://github.com/search?q=",
        },
        -- open http://localhost:post 
        ["p"] =
        {
            ["type"] = "post",
        },
        --  expand text
        ["t1"] =
        {
            ["type"] = "text",
            ["text"] = "15057466****",
        },
        ["t2"] =
        {
            ["type"] = "text",
            ["text"] = "moking97",
        },
        ["t3"] =
        {
            ["type"] = "text",
            ["text"] = "moking****@**.com",
        },
    }
end

obj.keyword = nil

function obj:encodeURI(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end


local function searchText(keys)
    hs.eventtap.keyStroke({ "cmd" }, "a", 0)
    hs.eventtap.keyStroke({ "cmd" }, "c", 0)

    hs.timer.doAfter(0.1, function ()
        local text = hs.pasteboard.readString()
        local searchKey = obj.keyword
        
        text = string.gsub(text, ('\\' .. searchKey), '')
        text = obj:encodeURI(text)

        local searchtext = keys.text .. text

        hs.urlevent.openURL(searchtext)
        
    end)
end

local function openUrl(keys)
    hs.urlevent.openURL(keys.url)
end

local function openPostUrl()
    hs.eventtap.keyStroke({ "cmd" }, "a", 0)
    hs.eventtap.keyStroke({ "cmd" }, "c", 0)

    hs.timer.doAfter(0.1, function ()
        local post = hs.pasteboard.readString()
        local searchKey = obj.keyword
        local interface = hs.network.interfaceDetails()
        local ip = interface.IPv4.Addresses[1]
        post = string.gsub(post, ('\\' .. searchKey), '')

        local searchtext = 'http://' .. ip .. ':' .. post

        hs.urlevent.openURL(searchtext)
        
    end)
end

local function expandText(keys)
    hs.pasteboard.setContents(keys.text)
    for i = 1, #obj.keyword  do
        hs.eventtap.keyStroke({ "" }, "delete", 0)
    end
    hs.eventtap.keyStroke({ "cmd" }, "v", 0)
end

obj.switchTypeFn = {  
    ["url"] = openUrl,
    ["search"] = searchText,
    ["post"] = openPostUrl,
    ["text"] = expandText,
}  

local function watchInput()
    local word = ""
    local keyMap = require"hs.keycodes".map
    local keyWatcher
    local DEBUG = false
    local start = false

    -- create an "event listener" function that will run whenever the event happens
    keyWatcher = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(ev)
        local keyCode = ev:getKeyCode()
        local char = ev:getCharacters()

        if start then
            word = word .. char
            if(#word > 10 or string.sub(word,1,1)=='\\') then
                word = ''
                start = false
                return;
            end

            if QuickText_list[word] then
                local keys = QuickText_list[word]
                local fn = obj.switchTypeFn[keys.type]
                obj.keyword = word
                fn(keys)

                word = "" 
                start = false
            end
        else
            if keyCode == keyMap["\\"] then
                start = true
            end
        end
        
       

    end):start() -- start the eventtap

    return keyWatcher
end

SearchKeyWatcher = nil

-- init
function obj:init()
    SearchKeyWatcher = watchInput()
end

return obj
