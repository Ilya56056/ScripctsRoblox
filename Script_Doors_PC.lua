-- Lib
local GUI = loadstring(game:HttpGet(('https://sirius.menu/rayfield')))()
-- Window
local Window = GUI:CreateWindow({
    Name = "Doors GUI",
    LoadingTitle = "Doors script is loading...",
    LoadingSubtitle = "Version: Beta 1.0",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })
-- Varbles
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LatestRoom = ReplicatedStorage.GameData.LatestRoom
-- Tabs
local VisualsTab = Window:CreateTab("Visuals", 4483362458)
local GameTab = Window:CreateTab("Game", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)
-- Toggles
Tab:CreateToggle({
    Name = "Nodify",
    CurrentValue = false,
    Flag = "MobSpawn", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value1)
        if Value1 = true then
            workspace.ChildAdded:Connect(function(inst)
                if inst.Name == "RushMoving" then
                    GUI:Notify({
                        Name = "Warning!",
                        Content = "Rush has spawned, hide!",
                        Time = 5
                    })
                end
                elseif inst.Name == "AmbushMoving" then
                        GUI:Notify({
                            Name = "Warning!",
                            Content = "Ambush has spawned, hide!",
                            Time = 5
                        })
                    end
                end
            end)
        end
    end,
end})
VisualsTab:CreateToggle({
    Name = "ESP Book",
    CurrentValue = false,
    Flag = "BookESP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value3)
        if Value3 = true then
            if LatestRoom.Value == 50 then
                if inst:IsDescendantOf(game:GetService("Workspace").CurrentRooms:FindFirstChild("50")) and ReplicatedStorage.GameData.LatestRoom.Value == 50 then
                    wait()
                    local Cham = Instance.new("Highlight")
                    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    Cham.FillColor = Color3.new(0, 1, 0.749019)
                    Cham.FillTransparency = 0.5
                    Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
                    Cham.Parent = game:GetService("CoreGui")
                    Cham.Enabled = GUI.Flags["BookESP"].Value
                    Cham.Adornee = inst
                    Cham.RobloxLocked = true
                    return Cham
                end
            end
        end
    end
end})
-- Buttons
GameTab:CreateButton({Name = "No jumpscares", Callback = function()
    pcall(function()
        ReplicatedStorage.Bricks.Jumpscare:Destroy()
        GUI:Notify({Name = "Info", Content = "Jumpscares deteles", Time = 5})
    end)
end})
-- Sliders
local TargetWalkspeed
PlayerTab:CreateSlider({Name = "Speed", Min = 0, Max = 50, Default = 5, Color = Color3.fromRGB(255,255,255), Increment = 1,
        Callback = function(Value)
                TargetWalkspeed = Value
        end})