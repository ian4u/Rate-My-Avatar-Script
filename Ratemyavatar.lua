local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Rate My Avatar v0.1 | By IAN", "DarkTheme")


-- Main script
local Tools_M = Window:NewTab("Tools")
local tools = Tools_M:NewSection("Tools")

local Tp_M = Window:NewTab("Teleports")
local tp = Tp_M:NewSection("Locations")

local Booth_M = Window:NewTab("Booth's")
local Booth = Booth_M:NewSection("Booth's")

local Loads_M = Window:NewTab("Load's")
local loads = Loads_M:NewSection("Load's")

local Misc = Window:NewTab("Misc")
local misc = Misc:NewSection("Settings")


-- misc
misc:NewKeybind("UI Key: RightControl", "Toggels ui", Enum.KeyCode.RightControl, function()
	Library:ToggleUI()
end)

misc:NewToggle("server chrasher use with aouto get sword", "", function(state)
    local num = 0
    while state do
        if game.Players.LocalPlayer:WaitForChild("Backpack"):FindFirstChild("ClassicSword") then
            print('YOU DUPED '+num+' SWORDS')
            game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool").Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Parent = game.Workspace
            wait(0.0)
        end
        wait(0.0)
    end
end)

--Booth's
Booth:NewToggle("Loop Update","",function(state)
    if state then
        Update_Bouth("HELLO",0)
        wait(0.5)
        Update_Bouth("MY",0)
        wait(0.5)
        Update_Bouth("FRIEND'S",0)
    else
        --nothing
    end
end)

Booth:NewButton("Blacklist all","",function()
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Name == game:GetService("Players").LocalPlayer.Name then
            print("You have been passed")
        else
            local args = {
                [1] = "AddBlacklist",
                [2] = v.Name
            }
            game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(args))
        end
    end
    Update_Bouth("You can't stand here",6403436082)
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
            wait(0.0)
        end
    else
        --nothing
    end
end)

-- Tp's
tp:NewButton("Tp to crown", "", function()
    tp_to(-243, 4, -245)
end)
tp:NewButton("Tp to club", "", function()
    tp_to(-5899,-54,22)
end)
tp:NewButton("Serverhop", "Hops to another server", function()
    Teleport()
end)
-- Id's 7637674803,11215015041,6403436082





-- Functions
function tp_to(c1,c2,c3)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(c1,c2,c3)
end
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
function Update_Bouth(Text,Immageid)
    local args = {
        [1] = "Update",
        [2] = {
            ["DescriptionText"] = Text,
            ["ImageId"] = Immageid
        }
    }
    game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(args))
end

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
function TPReturner()
   local Site;
   if foundAnything == "" then
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
   else
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
   end
   local ID = ""
   if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
       foundAnything = Site.nextPageCursor
   end
   local num = 0;
   for i,v in pairs(Site.data) do
       local Possible = true
       ID = tostring(v.id)
       if tonumber(v.maxPlayers) > tonumber(v.playing) then
           for _,Existing in pairs(AllIDs) do
               if num ~= 0 then
                   if ID == tostring(Existing) then
                       Possible = false
                   end
               else
                   if tonumber(actualHour) ~= tonumber(Existing) then
                       local delFile = pcall(function()
                           delfile("NotSameServers.json")
                           AllIDs = {}
                           table.insert(AllIDs, actualHour)
                       end)
                   end
               end
               num = num + 1
           end
           if Possible == true then
               table.insert(AllIDs, ID)
               wait()
               pcall(function()
                   writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                   wait()
                   game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
               end)
               wait(4)
           end
       end
   end
end
function Teleport()
   while wait() do
       pcall(function()
           TPReturner()
           if foundAnything ~= "" then
               TPReturner()
           end
       end)
   end
end
