-- Lib
local GUI = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
-- Window
local Window = GUI:MakeWindow({IntroText = "Doors GUI", Name = "Doors GUI",  HidePremium = false, SaveConfig = false})
-- Varbles
local UserInputService = game:GetService("UserInputService")
-- Notifications
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
    GUI:MakeNotification({Name = "! Warnig !", Content = "Scipt run on mobile and there may be bugs.", Time = 5})
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
end
-- Tabs
local VisualsTab = Window:MakeTab({Name = "Visuals", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local GameTab = Window:MakeTab({Name = "Game", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local PlayerTab = Window:MakeTab({Name = "Player", Icon = "rbxassetid://4483345998", PremiumOnly = false})
-- Toggle
GameTab:AddToggle({Name = "Notify when mob spawns", Default = false, Flag = "MobToggle" , Save = true})
-- Button