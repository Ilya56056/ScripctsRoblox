local GUI = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = GUI:MakeWindow({
	IntroText = "Murder Mystory GUI",
	Name = "Murder Mystory GUI", 
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "Config"
})
local VisualsTab = Window:MakeTab({
	Name = "Visuals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local MurderTab = Window:MakeTab({
	Name = "Murder",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local PlayerTab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})