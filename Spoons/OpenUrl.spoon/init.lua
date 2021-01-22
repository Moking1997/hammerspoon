local obj={}
obj.__index = obj

-- Metadata
obj.name = "OpenUrl"
obj.version = "1.0"
obj.author = "Moking1997 <Moking1997@icloud.com>"
obj.homepage = "https://github.com/Moking1997/hammerspoon"
obj.license = "MIT - https://opensource.org/licenses/MIT"

-- base settings
obj.url = {}
if not OpenUrl_list then
    obj.url = {
        {
            ["text"] = "Google",
            ["subText"] = "https://www.google.com/",
        },
        { 
            ["text"] = "Baidu",
            ["subText"] = "https://www.baidu.com/",
        },
        { 
            ["text"] = "PMS",
            ["subText"] = "http://pms.diwudai.com/index.php?m=my&f=index",
        },
        { 
            ["text"] = "Github",
            ["subText"] = "https://github.com/",
        },
        { 
            ["text"] = "Juejin",
            ["subText"] = "https://juejin.cn/",
        },
    }
    else
        obj.url = OpenUrl_list
end

for _, value in ipairs(obj.url) do
    value.text = hs.styledtext.new(value.text, {font={size=18}, color={hex="#4e769e"}})
end

-- init
function obj:init()
    obj.OpenUrl = hs.chooser.new(function (choice)
        if choice then
            hs.urlevent.openURL(choice.subText)
        end
    end)
end

---
--- toggleShow()
---
function obj:toggleShow()
    if obj.OpenUrl:isVisible() then
        obj.OpenUrl:hide()
    else
        obj.OpenUrl:choices(obj.url)
        obj.OpenUrl:show()
    end
end


return obj
