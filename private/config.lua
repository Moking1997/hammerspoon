-- 需要加载的 Spoon 插件
Spoon_list = {
    "ShowTime", -- 显示时间星期日期
    "SpeedMenu", -- 菜单栏显示网速
    "Clipboard", -- 剪切历史列表
    "WinWin", -- 窗口管理
    "OpenUrl", -- 快捷链接列表
    "QuickText", -- 快捷文字扩展
    "KSheet", -- 快捷键
}

-- 重新加载Hammerspoon配置
ReloadSetting_keys = {{"cmd", "shift", "ctrl"}, "R"}

-- WindowHints_keys切换 app 快键键
WindowHints_keys = {"alt", "tab"}

-- 显示/隐藏Hammerspoon控制台
ShowConsole_keys = {"alt", "Z"}

-- 显示/隐藏Clipboard剪切板历史
Clipboard_keys = {"alt", "C"}

-- 绑定 启动 app 快捷键
ShowApp_list = {
    {
        key = 'alt',
        letter = 'q',
        name = 'QQ'
    },
    {
        key = 'alt',
        letter = 'w',
        name = 'WeChat'
    },
}

-- 显示/隐藏网站链接列表
OpenUrl_keys = {"alt", "o"}
-- 快捷链接列表
OpenUrl_list = {
    {
        ["text"] = "Google",
        ["subText"] = "https://www.google.com/",
    },
    { 
        ["text"] = "Baidu",
        ["subText"] = "https://www.baidu.com/",
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

-- 快捷文字配置脚本
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
    ["r"] =
    {
        ["type"] = "text",
        ["text"] = "* rem",
    },
    -- todo
    ["todo"] =
    {
        ["type"] = "text",
        ["text"] = "//TODO:",
    },
}