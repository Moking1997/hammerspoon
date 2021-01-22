hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

----------------------------------------------------------------------------------------------------
-- 如果有自定义配置则使用
PrivateConfig = hs.fs.pathToAbsolute(os.getenv("HOME") .. '/.config/hammerspoon/private/config.lua')
if PrivateConfig then
    dofile( os.getenv("HOME") .. "/.config/hammerspoon/private/config.lua")
    PrivatePath = hs.fs.pathToAbsolute(hs.configdir .. '/private/config.lua')
else
    -- 否则使用默认配置
    if not PrivatePath then
        PrivatePath = hs.fs.pathToAbsolute(hs.configdir .. '/private')
        hs.fs.mkdir(hs.configdir .. '/private')
    end
    PrivateConf = hs.fs.pathToAbsolute(hs.configdir .. '/private/config.lua')
    if PrivateConf then
        require('private/config')
    end
end

ReloadSetting_keys = ReloadSetting_keys or {{"cmd", "shift", "ctrl"}, "R"}
if string.len(ReloadSetting_keys[2]) > 0 then
    hs.hotkey.bind(ReloadSetting_keys[1], ReloadSetting_keys[2], "重新加载配置!", function() hs.reload() end)
    hs.alert.show("重新加载Hammerspoon配置 ")
end

----------------------------------------------------------------------------------------------------
-- 加载 Spoon
hs.loadSpoon("ModalMgr")
if not Spoon_list then
    Spoon_list = {
        "ShowTime", -- 显示时间星期日期
        "SpeedMenu", -- 菜单栏显示网速
        "Clipboard", -- 剪切历史列表
        "WinWin", -- 窗口管理
        "OpenUrl", -- 快捷链接列表
        "QuickText", -- 快捷文字扩展
    }
end

for _, v in pairs(Spoon_list) do
    hs.loadSpoon(v)
end

----------------------------------------------------------------------------------------------------
-- 定义 windowHints 快捷键
WindowHints_keys = WindowHints_keys or {"alt", "tab"}
if string.len(WindowHints_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(WindowHints_keys[1], WindowHints_keys[2], '快速切换应用', function()
        spoon.ModalMgr:deactivateAll()
        hs.hints.windowHints()
    end)
end              


----------------------------------------------------------------------------------------------------
-- 窗口管理
if spoon.WinWin then
    spoon.ModalMgr:new("resizeM")
    local cmodal = spoon.ModalMgr.modal_list["resizeM"]
    cmodal:bind('', 'escape', '退出 ', function() spoon.ModalMgr:deactivate({"resizeM"}) end)
    cmodal:bind('', 'Q', '退出', function() spoon.ModalMgr:deactivate({"resizeM"}) end)
    cmodal:bind('', 'tab', '显示/隐藏键位提示', function() spoon.ModalMgr:toggleCheatsheet() end)

    cmodal:bind('', 'A', '向左移动', function() spoon.WinWin:stepMove("left") end, nil, function() spoon.WinWin:stepMove("left") end)
    cmodal:bind('', 'D', '向右移动', function() spoon.WinWin:stepMove("right") end, nil, function() spoon.WinWin:stepMove("right") end)
    cmodal:bind('', 'W', '向上移动', function() spoon.WinWin:stepMove("up") end, nil, function() spoon.WinWin:stepMove("up") end)
    cmodal:bind('', 'S', '向下移动', function() spoon.WinWin:stepMove("down") end, nil, function() spoon.WinWin:stepMove("down") end)

    cmodal:bind('', 'H', '左半屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfleft") end)
    cmodal:bind('', 'L', '右半屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfright") end)
    cmodal:bind('', 'K', '上半屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfup") end)
    cmodal:bind('', 'J', '下半屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfdown") end)

    cmodal:bind('', 'Y', '屏幕左上角', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerNW") end)
    cmodal:bind('', 'O', '屏幕右上角', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerNE") end)
    cmodal:bind('', 'U', '屏幕左下角', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerSW") end)
    cmodal:bind('', 'I', '屏幕右下角', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerSE") end)

    cmodal:bind('', 'F', '全屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("fullscreen") end)
    cmodal:bind('', 'C', '居中', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("center") end)
    cmodal:bind('', 'G', '左三分之二屏居中分屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("centermost") end)
    cmodal:bind('', 'Z', '展示显示', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("show") end)
    cmodal:bind('', 'V', '编辑显示', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("shows") end)

   cmodal:bind('', 'X', '二分之一居中分屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("center-2") end)

    cmodal:bind('', '=', '窗口放大', function() spoon.WinWin:moveAndResize("expand") end, nil, function() spoon.WinWin:moveAndResize("expand") end)
    cmodal:bind('', '-', '窗口缩小', function() spoon.WinWin:moveAndResize("shrink") end, nil, function() spoon.WinWin:moveAndResize("shrink") end)

    cmodal:bind('ctrl', 'H', '向左收缩窗口', function() spoon.WinWin:stepResize("left") end, nil, function() spoon.WinWin:stepResize("left") end)
    cmodal:bind('ctrl', 'L', '向右扩展窗口', function() spoon.WinWin:stepResize("right") end, nil, function() spoon.WinWin:stepResize("right") end)
    cmodal:bind('ctrl', 'K', '向上收缩窗口', function() spoon.WinWin:stepResize("up") end, nil, function() spoon.WinWin:stepResize("up") end)
    cmodal:bind('ctrl', 'J', '向下扩镇窗口', function() spoon.WinWin:stepResize("down") end, nil, function() spoon.WinWin:stepResize("down") end)


    cmodal:bind('', 'left', '窗口移至左边屏幕', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("left") end)
    cmodal:bind('', 'right', '窗口移至右边屏幕', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("right") end)
    cmodal:bind('', 'up', '窗口移至上边屏幕', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("up") end)
    cmodal:bind('', 'down', '窗口移动下边屏幕', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("down") end)
    cmodal:bind('', 'space', '窗口移至下一个屏幕', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("next") end)
    cmodal:bind('', 'B', '撤销最后一个窗口操作', function() spoon.WinWin:undo() end)
    cmodal:bind('', 'R', '重做最后一个窗口操作', function() spoon.WinWin:redo() end)

    cmodal:bind('', '[', '左三分之二屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("mostleft") end)
    cmodal:bind('', ']', '右三分之二屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("mostright") end)
    cmodal:bind('', ',', '左三分之一屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("lesshalfleft") end)
    cmodal:bind('', '.', '中分之一屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("onethird") end)
    cmodal:bind('', '/', '右三分之一屏', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("lesshalfright") end)

    cmodal:bind('', 't', '将光标移至所在窗口中心位置', function() spoon.WinWin:centerCursor() end)

    -- 定义窗口管理模式快捷键/
    hsresizeM_keys = hsresizeM_keys or {"alt", "R"}
    if string.len(hsresizeM_keys[2]) > 0 then
        spoon.ModalMgr.supervisor:bind(hsresizeM_keys[1], hsresizeM_keys[2], "进入窗口管理模式", function()
            spoon.ModalMgr:deactivateAll()
            -- 显示状态指示器，方便查看所处模式
            spoon.ModalMgr:activate({"resizeM"}, "#B22222")
            spoon.ModalMgr:toggleCheatsheet()
        end)
    end
end


----------------------------------------------------------------------------------------------------
-- 绑定 ShowTime 快捷键
if spoon.ShowTime then
    hsaclock_keys = hsaclock_keys or {"alt", "T"}
    if string.len(hsaclock_keys[2]) > 0 then
        spoon.ModalMgr.supervisor:bind(hsaclock_keys[1], hsaclock_keys[2], "显示时间日期", function() spoon.ShowTime:toggleShow() end)
    end
end

----------------------------------------------------------------------------------------------------
-- 绑定 剪切板历史 快捷键
if spoon.Clipboard then
    Clipboard_keys = Clipboard_keys or {"alt", "C"}
    if string.len(Clipboard_keys[2]) > 0 then
        spoon.ModalMgr.supervisor:bind(Clipboard_keys[1], Clipboard_keys[2], "查看剪切板历史", function() spoon.Clipboard:toggleShow() end)
    end
end

-- 快键打开指定网站
----------------------------------------------------------------------------------------------------
if spoon.OpenUrl then
    OpenUrl_keys = OpenUrl_keys or {"alt", "O"}
    if string.len(OpenUrl_keys[2]) > 0 then
        spoon.ModalMgr.supervisor:bind(OpenUrl_keys[1], OpenUrl_keys[2], "快键打开指定网站", function() spoon.OpenUrl:toggleShow() end)
    end
end

-- 显示/隐藏 Hammerspoon 控制台
ShowConsole_keys = ShowConsole_keys or {"alt", "Z"}
if string.len(ShowConsole_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(ShowConsole_keys[1], ShowConsole_keys[2], "打开 Hammerspoon 控制台", function() hs.toggleConsole() end)
end


----------------------------------------------------------------------------------------------------
-- 绑定 启动 app 快捷键
----------------------------------------------------------------------------------------------------

local function toggleApp(name)
    local focusApp = hs.application.frontmostApplication()
    local openApp = hs.application.open(name)

    if openApp == focusApp then
        focusApp:hide()
    end
end

for _, v in ipairs(ShowApp_list) do
    spoon.ModalMgr.supervisor:bind(v.key, v.letter, ('启动 ' .. v.name), function() toggleApp(v.name) end)
end

-- 初始化 modalMgr
spoon.ModalMgr.supervisor:enter()

