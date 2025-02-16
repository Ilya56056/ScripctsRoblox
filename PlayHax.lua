local G2L = {};
local UIS = game:GetService("UserInputService")

G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[PlayHaxGUI]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["Draggable"] = true;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(169, 169, 169);
G2L["2"]["Size"] = UDim2.new(0, 165, 0, 123);
G2L["2"]["Position"] = UDim2.new(0.32777, 0, 0.18495, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["TextWrapped"] = true;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextScaled"] = true;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(148, 148, 148);
G2L["3"]["TextSize"] = 14;
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Size"] = UDim2.new(0, 165, 0, 50);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[PlayHax]];
G2L["3"]["Name"] = [[PlayHax]];


G2L["4"] = Instance.new("UICorner", G2L["3"]);



G2L["5"] = Instance.new("UICorner", G2L["2"]);



G2L["6"] = Instance.new("TextButton", G2L["2"]);
G2L["6"]["TextWrapped"] = true;
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["TextSize"] = 20;
G2L["6"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(105, 105, 105);
G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6"]["Size"] = UDim2.new(0, 165, 0, 50);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Text"] = [[Auto Play (OFF)]];
G2L["6"]["Position"] = UDim2.new(0, 0, 0.49199, 0);


G2L["7"] = Instance.new("LocalScript", G2L["6"]);



local function C_7()
local script = G2L["7"];
	local toggle = false
	local timetopass = 0
	
	script.Parent.MouseButton1Click:Connect(function()
		if toggle == false then
			toggle = true
			local timetopass = 0.51
			
			workspace.Bombs.ChildAdded:Connect(function(child)
				if child:FindFirstChild("Highlight") then
					while child.Parent do
						local time = child:FindFirstChild("Highlight")
						if time then
							if time.FillTransparency <= timetopass then game:GetService("ReplicatedStorage"):WaitForChild("Rounds"):WaitForChild("Core"):WaitForChild("Default"):WaitForChild("Remotes"):WaitForChild("Pass"):InvokeServer("Forward")
							end
						end
						task.wait()
					end
				end
			end)
			
			script.Parent.Text = "Auto Play (ON)"
		else
			timetopass = 0
			script.Parent.Text = "Auto Play (OFF)"
			toggle = false
		end
	end)
end;
task.spawn(C_7);

UIS.InputBegan:Connect(function(key, proccess)
	if key.KeyCode == Enum.KeyCode.W then
		game:GetService("ReplicatedStorage").Rounds.Core.Default.Remotes.Pass:InvokeServer("Forward")
	end
	if key.KeyCode == Enum.KeyCode.A then
		game:GetService("ReplicatedStorage").Rounds.Core.Default.Remotes.Pass:InvokeServer("Left")
	end
	if key.KeyCode == Enum.KeyCode.D then
		game:GetService("ReplicatedStorage").Rounds.Core.Default.Remotes.Pass:InvokeServer("Right")
	end
end)

return G2L["1"], require;
