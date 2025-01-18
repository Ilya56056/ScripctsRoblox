local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()

local spintime = workspace.Slots.Slots.Screen.SlotGui.TimeLeftFrame.TimeText.Text
spintime.Changed:Connect(function()
    if spintime == "1:00" then
        Notification.new("message", "Spin Time", "Time: 1 minutes")
    end
    if spintime == "5:00" then
        Notification.new("message", "Spin Time", "Time: 5 minutes")
    end
    if spintime == "0:30" then
        Notification.new("message", "Spin Time", "Time: 30 seconds")
    end
end)
