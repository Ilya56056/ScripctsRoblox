-- Lib
local GUI = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
-- Window
local Window = GUI:MakeWindow({IntroText = "Doors GUI", Name = "Doors GUI",  HidePremium = false, SaveConfig = false})
-- Varbles
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LatestRoom = ReplicatedStorage.GameData.LatestRoom
local ChaseStart = ReplicatedStorage.GameData.ChaseStart
local BookChams = {}
--local Player = 
-- Notifications
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
    GUI:MakeNotification({Name = "! Warnig !", Content = "Scipt run on mobile and there may be bugs.", Time = 5})
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
end
-- Tabs
local VisualsTab = Window:MakeTab({Name = "Visuals", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local GameTab = Window:MakeTab({Name = "Game", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local PlayerTab = Window:MakeTab({Name = "Player", Icon = "rbxassetid://4483345998", PremiumOnly = false})
-- Toggles
GameTab:AddToggle({Name = "Notify when mob spawns", Default = false, Flag = "MobSpawn" , Save = true})
GameTab:AddToggle({Name = "Avoid Rush/Ambush", Default = false, Flag = "AvoidRush",Save = true})
VisualsTab:AddToggle({Name = "Book ESP", Default = false, Flag = "BookESP", Save = true,
        Callback = function(Value)
                for i,v in pairs(BookChams) do
                v.Enabled = Value
            end
        end})
-- Buttons
GameTab:AddButton({Name = "No jumpscares", Callback = function()
    pcall(function()
        ReplicatedStorage.Bricks.Jumpscare:Destroy()
        GUI:MakeNotification({Name = "Info", Content = "Jumpscares deteles", Time = 5})
    end)
    end})
-- Sliders
local TargetWalkspeed
PlayerTab:AddSlider({Name = "Speed", Min = 0, Max = 50, Default = 5, Color = Color3.fromRGB(255,255,255), Increment = 1,
        Callback = function(Value)
                TargetWalkspeed = Value
        end})
-- Activions
local function ApplyBookChams(inst)
    if inst:IsDescendantOf(game:GetService("Workspace").CurrentRooms:FindFirstChild("50")) and ReplicatedStorage.GameData.LatestRoom.Value == 50 then
        wait()
        local Cham = Instance.new("Highlight")
        Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Cham.FillColor = Color3.new(0, 1, 0.749019)
        Cham.FillTransparency = 0.5
        Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
        Cham.Parent = game:GetService("CoreGui")
        Cham.Enabled = OrionLib.Flags["BookESP"].Value
        Cham.Adornee = inst
        Cham.RobloxLocked = true
        return Cham
    end
end
local NotificationCoroutine = coroutine.create(function()
    LatestRoom.Changed:Connect(function()
        if OrionLib.Flags["PredictToggle"].Value == true then
            local n = ChaseStart.Value - LatestRoom.Value
            if 0 < n and n < 4 then
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Event in " .. tostring(n) .. " rooms.",
                    Time = 5
                })
            end
        end
        if OrionLib.Flags["BookESP"].Value == true then
            if LatestRoom.Value == 50 then
                coroutine.resume(BookCoroutine)
            end
        end
        if OrionLib.Flags["FigureToggle"].Value == true then
            if LatestRoom.Value == 50 then
                coroutine.resume(EntityCoroutine)
            end
        end
    end)
    workspace.ChildAdded:Connect(function(inst)
        if inst.Name == "RushMoving" and OrionLib.Flags["MobSpawn"].Value == true then
            if OrionLib.Flags["AvoidRush"].Value == true then
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Avoiding Rush. Please wait.",
                    Time = 5
                })
                local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local con = game:GetService("RunService").Heartbeat:Connect(function()
                    game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                end)
               
                inst.Destroying:Wait()
                con:Disconnect()
 
                game.Players.LocalPlayer.Character:MoveTo(OldPos)
            else
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Rush has spawned, hide!",
                    Time = 5
                })
            end
        elseif inst.Name == "AmbushMoving" and OrionLib.Flags["MobSpawn"].Value == true then
            if OrionLib.Flags["AvoidRush"].Value == true then
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Avoiding Ambush. Please wait.",
                    Time = 5
                })
                local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local con = game:GetService("RunService").Heartbeat:Connect(function()
                    game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                end)
               
                inst.Destroying:Wait()
                con:Disconnect()
               
                game.Players.LocalPlayer.Character:MoveTo(OldPos)
            else
                OrionLib:MakeNotification({
                    Name = "Warning!",
                    Content = "Ambush has spawned, hide!",
                    Time = 5
                })
            end
        end
    end)
end)
-- Init
coroutine.resume(NotificationCoroutine)
GUI:Init()
task.wait(2)
