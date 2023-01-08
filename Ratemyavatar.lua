local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Rate My Avatar v0.1", "DarkTheme")


-- Main script
local Tools_M = Window:NewTab("Tools By Ian")
local tools = Tools_M:NewSection("Tools")
local Tp_M = Window:NewTab("Teleports")
local tp = Tp_M:NewSection("Locations")
local Loads_M = Window:NewTab("Loads")
local loads = Loads_M:NewSection("Load's")
local Misc = Window:NewTab("Misc")
local misc = Misc:NewSection("Settings")

misc:NewKeybind("UI Key: RightControl", "Toggels ui", Enum.KeyCode.RightControl, function()
	Library:ToggleUI()
end)


-- Loads
loads:NewButton("Fates Admin", "A very helpfull admin script", function()
    print("Fates Admin will be loaded")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
end)

-- Tools
tools:NewButton("Give sword", "Gives a sword (need to be knight)", function()
    get_sord()
    print("Got sword")
end)

tools:NewButton("Give Text sign", "Gives a Text sign (need gamepass)", function()
    get_item_by_id(17291420)
    print("Got Textsign")
end)

tools:NewButton("Give Stop sign", "Gives a Stop sign (need gamepass)", function()
    get_item_by_id(17290248)
    print("Got Stopsign")
end)

tools:NewButton("Give Image sign", "Gives a Iamge sign (need gamepass)", function()
    get_item_by_id(17291427)
    print("Got Imagesign")
end)

tools:NewToggle("Toggels all loops", "", function(state)
    if state then
        local global toggel = true
    else
        local global toggel = false
    end
end)

tools:NewToggle("Loopgive Image sign", "Gives a Iamge sign (need gamepass)", function(state)
    if state then
        while toggel do
            get_item_by_id(17291427)
            wait(1)
        end
    else
        --nothing
    end
end)

tools:NewToggle("Loopgive Stop sign", "Gives a Stop sign (need gamepass)", function(state)
    if state then
        while toggel do
            get_item_by_id(17290248)
            wait(1)
        end
    else
        --nothing
    end
end)

tools:NewToggle("Loopgive Text sign", "Gives a Text sign (need gamepass)", function(state)
    if state then
        while toggel do
            get_item_by_id(17291420)
            wait(1)
        end
    else
        --nothing
    end
end)

tools:NewToggle("Loopgive sword", "Gives a sword (need to be knight)", function(state)
    if state then
        while toggel do
            get_sord()
            wait(1)
        end
    else
        --nothing
    end
end)

-- Tp's
tp:NewButton("Tp to crown", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(246,4,-242)
end)






-- Functions
function get_sord()
	local args = {
    	[1] = "ClassicSword"
	}
	game:GetService("ReplicatedStorage").RequestTool:FireServer(unpack(args))
end
function get_item_by_id(id)
    local args = {
        [1] = id
    }
    game:GetService("ReplicatedStorage").RequestGamepassTool:FireServer(unpack(args))
end
