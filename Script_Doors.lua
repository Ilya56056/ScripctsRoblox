-- Lib
local GUI = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
-- Window
local Window = GUI:MakeWindow({IntroText = "Doors GUI", Name = "Doors GUI",  HidePremium = false, SaveConfig = false})
-- Varbles
local UserInputService = game:GetService("UserInputService")
local BookChams = {}
--local Player = 
-- Notifications
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
    GUI:MakeNotification({Name = "! Warnig !", Content = "Scipt run on mobile and there may be bugs.", Time = 5})
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
end
if game.PlaceId == 6516141723 then
    OrionLib:MakeNotification({Name = "Error", Content = "Please execute when in game, not in lobby.", Time = 2})
end
-- Tabs
local VisualsTab = Window:MakeTab({Name = "Visuals", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local GameTab = Window:MakeTab({Name = "Game", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local PlayerTab = Window:MakeTab({Name = "Player", Icon = "rbxassetid://4483345998", PremiumOnly = false})
-- Toggles
GameTab:AddToggle({Name = "Notify when mob spawns", Default = false, Flag = "MobSpawn" , Save = true})
VisualsTab:AddToggle({Name = "ESP", Default = false, Flag = "ESP" , Save = true})
VisualsTab:AddToggle({Name = "Book Chams", Default = false, Flag = "BookToggle", Save = true,
        Callback = function(Value)
                for i,v in pairs(BookChams) do
                v.Enabled = Value
            end
        end})
-- Buttons

-- Sliders
local TargetWalkspeed
PlayerTab:AddSlider({Name = "Speed", Min = 0, Max = 50, Default = 5, Color = Color3.fromRGB(255,255,255), Increment = 1,
        Callback = function(Value)
                TargetWalkspeed = Value
        end})
-- Activions
local function ApplyBookChams(inst)
    if inst:IsDescendantOf(game:GetService("Workspace").CurrentRooms:FindFirstChild("50")) and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 50 then
        wait()
        local Cham = Instance.new("Highlight")
        Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Cham.FillColor = Color3.new(0, 1, 0.749019)
        Cham.FillTransparency = 0.5
        Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
        Cham.Parent = game:GetService("CoreGui")
        Cham.Enabled = OrionLib.Flags["BookToggle"].Value
        GUI.MakeNotification({Name = "Info", Content = OrionLib.Flags["BookToggle"].Value, Time = 5})
        Cham.Adornee = inst
        Cham.RobloxLocked = true
        return Cham
    end
end
