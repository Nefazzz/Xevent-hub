  
  -----------------------------------------------------------------------------
  ----made by XEVENT HUB-------------


_G.antiscan = true

getgenv().A = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).wrapAttackAnimationAsync

getgenv().B = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle).play
_G.setfflag = true

spawn(function()
    while wait() do
        if _G.setfflag then
            setfflag("AbuseReportScreenshot", "False")
            setfflag("AbuseReportScreenshotPercentage", "0")
        end
    end
end)

  if not game:IsLoaded() then game.Loaded:Wait() end
  repeat wait() until game.Players
  repeat wait() until game.Players.LocalPlayer
  repeat wait() until game.ReplicatedStorage
  repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
  repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
  repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
 
 
  ---------Config
  
  if not getgenv().Config then
      getgenv().Config = {
          autofarmlevel = false,
          autonewworld = false,
          selectweapon = "",
          fastattack = true,
          buso = true,
          ken = true,
          auto_whitescreen = true,
          remove_effect = false
      }
  end
  
  getgenv().automelee = {
      superhuman = false
  }
  
  getgenv().noclip = false
  
  ---------
  
  function two(gotoCFrame) --- Tween
      pcall(function()
          game.Players.LocalPlayer.Character.Humanoid.Sit = false
          game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
      end)
      if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude <= 200 then
          pcall(function() 
              tweenz:Cancel()
          end)
          game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = gotoCFrame
      else
          local tween_s = game:service"TweenService"
          local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude/325, Enum.EasingStyle.Linear)
           tween, err = pcall(function()
              tweenz = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = gotoCFrame})
              tweenz:Play()
          end)
          if not tween then return err end
      end
      function _TweenCanCle()
          tweenz:Cancel()
      end
  end
  
  function RobloxNotify(Ti,tab,icon,sec)-----robloxnotify
      game.StarterGui:SetCore("SendNotification", {
      Title = Ti,
      Text = tab,
      Icon = icon,
      Duration = sec,
      })
  end 
  
  function bloxnot(text)----blox fruit
      require(game.ReplicatedStorage.Notification).new(text):Display()
  end
  
  function HopServer()-----hopserver
      local PlaceID = game.PlaceId
      local AllIDs = {}
      local foundAnything = ""
      local actualHour = os.date("!*t").hour
      local Deleted = false
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
                          -- delfile("NotSameServers.json")
                          AllIDs = {}
                          table.insert(AllIDs, actualHour)
                          end)
                      end
                  end
                      num = num + 1
              end
                  if Possible == true then
                  table.insert(AllIDs, ID)
                  task.wait()
                  pcall(function()
                  -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                  wait()
                  game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                  end)
                  wait(.1)
              end
          end
      end
  end
                                      
  function Teleport() 
          while wait(1) do
              pcall(function()
                  TPReturner()
                  if foundAnything ~= "" then
                      TPReturner()
                  end
              end)
          end
      end
      Teleport()
  end
  
  function HOP()
      HopServer()
      HopServer()
      HopServer()
      HopServer()
      HopServer()
      while wait(0.2) do
          pcall(function()
              HopServer()
              if foundAnything ~= "" then
                  HopServer()
              end
          end)
      end
  end
  
  gamelist = {
      2753915549,
      4442272183,
      7449423635
  }
  
  spawn(function()-----anti wrong game
      if table.find(gamelist,game.PlaceId) then
          RobloxNotify("Xevent Hub","Loading..",'',2) 
      else
          RobloxNotify("Xevent Hub","This script doesnt support this game",'',2) 
          task.wait(2)
          game.Players.localPlayer:Kick('Doesnt support this game')
      end
  end)
  
  local placeId = game.PlaceId
  if placeId == 2753915549 then
      world1 = true
  elseif placeId == 4442272183 then
      world2 = true
  elseif placeId == 7449423635 then
      world3 = true
  end
  
    
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/naypramx/Ui__Project/Script/XeNonUi", true))()
    library:CreateWatermark("Xevent Hub")
    local CenterHubNo1 = library:CreateWindow(os.date("Xevent Hub - %A %d %B %Y"),Enum.KeyCode.RightControl)
    local Tab = CenterHubNo1:CreateTab("Genaral")
    local Tab1 = CenterHubNo1:CreateTab("Item")
    local Tab2 = CenterHubNo1:CreateTab("Teleport")
    local Tab3 = CenterHubNo1:CreateTab("Misc")
      local Sector1 = Tab:CreateSector("Function Auto Farm","left")
      
      Sector1:AddDropdown("Select Weapon",{"Melee","Sword"},"Select Weapon",false,function(x)
      getgenv().Config.selectweapon = x
      end)
  
    Sector1:AddToggle("Auto Farm Level",getgenv().Config.autofarmlevel,function(x)
         getgenv().Config.autofarmlevel = x
        print(x)
      FarmStat = x
      _TweenCanCle()
  end)
  if world1 then---newworld1
      Sector1:AddToggle("Auto Second Sea",getgenv().Config.autonewworld,function(x)
          getgenv().Config.autonewworld = x
      end)
  end
  
  
  if world2 then---newworld2
      
      Sector1:AddToggle("Auto Third Sea",getgenv().Config.autonewworld,function(x)
  getgenv().Config.autonewworld = x
          local args = {
              [1] = "AbandonQuest"
          }
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
          Sea3 = Toggles["Auto_Third_Sea"].Value
          Sea33 = Toggles["Auto_Third_Sea"].Value
          Check = true
          Checka = true
      end)
  end
  
  
      local Sector2 = Tab:CreateSector("Setting Auto Farm","Right")
  
  Sector2:AddButton("Remove Animation",function()
     local Client = game.Players.LocalPlayer
  local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
  local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
  spawn(function()----delete animation
  if not shared.orl then shared.orl = STOPRL.wrapAttackAnimationAsync end
  if not shared.cpc then shared.cpc = STOP.play end
  while task.wait() do
              STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
              local Hits = STOPRL.getBladeHits(b,c,d)
                  if Hits then
                      STOP.play = function() end
                      a:Play(0.01,0.01,0.01)
                      func(Hits)
                      STOP.play = shared.cpc
                      wait(a.length * 0.5)
                      a:Stop()
              end
          end
  end
  end)
  end)
  
  Sector2:AddToggle("Fast Attack",getgenv().Config.fastattack,function(x)
   getgenv().Config.fastattack = x
  end)
  
  
  Sector2:AddToggle("Auto Buso",getgenv().Config.buso,function(x)
      getgenv().Config.buso = x
  end)
  
  Sector2:AddToggle("Auto Instinct",getgenv().Config.ken,function(x)
      getgenv().Config.ken = x
  end)
  
  
  Sector2:AddToggle("Remove Effect",getgenv().Config.remove_effect,function(x)
  getgenv().Config.remove_effect = x
  end)
  
   local Sector3 = Tab:CreateSector("Status","Right")
  
  Sector3:AddToggle("Fully Stat",getgenv().Fullystats,function(x)
      getgenv().Fullystats = x
  end)
  
  Sector3:AddToggle("Mele",getgenv().melee,function(x)
      getgenv().melee = x
  end)
  
  Sector3:AddToggle("Defense",getgenv().defense,function(x)
     getgenv().defense = x
  end)
  
  Sector3:AddToggle("Sword",getgenv().sword,function(x)
      getgenv().sword = x
  end)
  
  
  Sector3:AddToggle("Gun",getgenv().gun,function(x)
      getgenv().gun = x
  end)
  
  
  Sector3:AddToggle("Blox Fruit",getgenv().df,function(x)
      getgenv().df = x
  end)
  
  Sector3:AddSlider("Stat Point",1,1,2300,1,function(x)
     statper = x
  end)
  
  spawn(function()---stat
      while task.wait() do
          spawn(function()
              if getgenv().melee or getgenv().Fullystats then
                  local args = {
                  [1] = "AddPoint",
                  [2] = "Melee",
                  [3] = 1
                  }
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
          end
      end)
      spawn(function()
          if getgenv().defense or getgenv().Fullystats then
              local args = {
                  [1] = "AddPoint",
                  [2] = "Defense",
                  [3] = 1
              }
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
          end
      end)
      spawn(function()
          if getgenv().sword then
              local args = {
              [1] = "AddPoint",
              [2] = "Sword",
              [3] = 1
              }
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
          end
      end)
      spawn(function()
          if getgenv().gun then
              local args = {
              [1] = "AddPoint",
              [2] = "Gun",
              [3] = 1
              }
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
          end
      end)
      spawn(function()
          if getgenv().df then
              local args = {
              [1] = "AddPoint",
              [2] = "Demon Fruit",
              [3] = 1
              }
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
          end
      end)
      end    
  end)
  
  
      local Sector4 = Tab:CreateSector("Special Melee","left")
  
  Sector4:AddToggle("Auto Superhuman", getgenv().automelee.superhuman,function(x)
      getgenv().automelee.superhuman = x
  end)
  
  local Sector5 = Tab:CreateSector(" Character","left")
  
  Sector5:AddToggle("Auto Random Fruit",RandomFruit,function(x)
        RandomFruit = x
  end)
  Sector5:AddToggle("Auto Store Fruit",_G.AutoRaidStoreFruit,function(x)
       _G.StoreFruit = x
  end)
      spawn(function()
      while wait() do
          if _G.StoreFruit then
              pcall(function()
                  if _G.StoreFruit then
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bomb-Bomb")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spike-Spike")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Chop-Chop")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spring-Spring")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rocket Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rocket")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Smoke-Smoke")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spin-Spin")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Flame-Flame")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Falcon")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ice-Ice")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sand-Sand")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dark-Dark")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ghost Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Ghost-Ghost")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Diamond-Diamond")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Light-Light")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rubber-Rubber")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Barrier-Barrier")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Magma-Magma")
                      end
                  end
                  if not trygettrevo then
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Quake-Quake")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Human-Human: Buddha")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Love-Love")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spider-Spider")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sound Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sound Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Sound-Sound")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit") then
                         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Bird-Bird: Phoenix")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Portal-Portal")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Rumble-Rumble")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Pain-Pain")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Gravity-Gravity")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("TRex Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("TRex Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","TRex-TRex")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mammoth Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Mammoth Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Mammoth-Mammoth")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dough-Dough")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Shadow-Shadow")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Venom-Venom")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Control-Control")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Spirit-Spirit")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Dragon-Dragon")
                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Leopard-Leopard")

                      end
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kitsune Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kitsune Fruit") then
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit","Kitsune-Kitsune")

                      end
                  end
              end)
          end
      end
  end)
  
  Sector5:AddToggle("Bring Fruit", _G.CollectFruit,function(x)
  _G.CollectFruit = x
  end)
  
  spawn(function()
  game:GetService('RunService').Stepped:Connect(function()
      if _G.CollectFruit then
      for i, v in pairs(game.workspace:GetChildren()) do
          if(v:IsA('Tool')) and string.find(v.Name,'Fruit') then
              v.Parent = game.Players.localPlayer.Backpack
          end
      end
  end
  end)
  end)
  
  Sector5:AddButton("Copy CFrame",function()
      setclipboard('CFrame.new('..tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)..')')
  end)
  
  Sector5:AddButton("Reset Character",function()
      game.Players.localPlayer.Character.Head:Remove()
  end)
  
  
   local Sector6 = Tab1:CreateSector("Buy Melee","left")
  Sector6:AddButton("Black Leg [ $150,000 Belly ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
  end)
  
  Sector6:AddButton("Electro [ $500,000 Belly ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
  end)
  
  Sector6:AddButton("Fishman Karate [ $750,000 Belly ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
  end)
  
  Sector6:AddButton("DragonClaw [ 1.500 Fragment ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
  end)
  
  Sector6:AddButton("Superhuman [ $3,000,000 Belly ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
  end)
  
  Sector6:AddButton("DeathStep [ $2,500,000 Belly 5,000 Fragment ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
  end)
  
  Sector6:AddButton("SharkmanKarate [ $2,500,000 Belly 5,000 Fragment ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
  end)
  
  Sector6:AddButton("ElectricClaw [ $3,000,000 Belly 5,000 Fragment ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
  end)
  
  Sector6:AddButton("DragonTalon [ $3,000,000 Belly 5,000 Fragment ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
  end)
  
  Sector6:AddButton("Godhuman [ $5,000,000 Belly 5,000 Fragment ]",function()
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
  end)
  
  function UnEquipWeapon(Weapon)
    if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
        _G.NotAutoEquip = true
        wait(.5)
        game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
        wait(.1)
        _G.NotAutoEquip = false
    end
end

  local Sector7 = Tab2:CreateSector("Island All Map","left")
  
  if world1 then
      Island = {
          "Start Island",
          "Marine Start",
          "Middle Town",
          "Jungle",
          "Pirate Village",
          "Desert",
          "Frozen Village",
          "MarineFord",
          "Colosseum",
          "Sky 1st Floor",
          "Sky 2st Floor",
          "Sky 3st Floor",
          "Prison",
          "Magma Village",
          "UndeyWater City" ,
          "Fountain City",
          "House Cyborg's",
          "Shank's Room",
          "Mob Island",
      }
  elseif world2 then
      Island = {
          "First Spot",
          "Kingdom of Rose",
          "Dark Ares",
          "Flamingo Mansion",
          "Flamingo Room",
          "Green bit",
          "Cafe",
          "Factroy",
          "Colosseum",
          "Ghost Island",
          "Ghost Island 2nd",
          "Snow Mountain",
          "Hot and Cold",
          "Magma Side",
          "Cursed Ship",
          "Frosted Island",
          "Forgotten Island",
          "Usoapp Island",
          "Raids Low",
          "Minisky",
      }
  elseif world3 then
      Island = {
          "Port Town",
          "Hydra Island",
          "Room Enma/Yama/Secret Temple",
          "House Hydra Island",
          "Great Tree",
          "Castle on the sea",
          "Mansion",
          "Floating Turtlea",
          "Haunted Castle",
          "Peanut Island",
          "Ice Cream Island",
          "CakeLoaf"
      }
  end
  
  
  SelectedIsland = nil
  Sector7:AddDropdown("Select Place",Island,"Select",false,function(x)
     SelectedIsland = x
  end)
  
  _statetp = false
  Sector7:AddToggle("Tween to Place", _statetp ,function(x)
  _statetp = x
      if _statetp then
          repeat wait()
              getgenv().noclip = true
              if world1 then 
                  if SelectedIsland == "Start Island" then
                      two(CFrame.new(1071.2832, 16.3085976, 1426.86792))
                      end
                      if SelectedIsland == "Marine Start" then
                          two(CFrame.new(-2573.3374, 6.88881969, 2046.99817))
                      end
                      if SelectedIsland == "Middle Town" then
                          two(CFrame.new(-655.824158, 7.88708115, 1436.67908))
                      end
                      if SelectedIsland == "Jungle" then
                          two(CFrame.new(-1249.77222, 11.8870859, 341.356476))
                      end
                      if SelectedIsland == "Pirate Village" then
                          two(CFrame.new(-1122.34998, 4.78708982, 3855.91992))
                      end
                      if SelectedIsland == "Desert" then
                          two(CFrame.new(1094.14587, 6.47350502, 4192.88721))
                      end
                      if SelectedIsland == "Frozen Village" then
                          two(CFrame.new(1198.00928, 27.0074959, -1211.73376))
                      end
                      if SelectedIsland == "MarineFord" then
                          two(CFrame.new(-4505.375, 20.687294, 4260.55908))
                      end
                      if SelectedIsland == "Colosseum" then
                          two(CFrame.new(-1428.35474, 7.38933945, -3014.37305))
                      end
                      if SelectedIsland == "Sky 1st Floor" then
                          two(CFrame.new(-4970.21875, 717.707275, -2622.35449))
                      end
                      if SelectedIsland == "Sky 2st Floor" then
                          two(CFrame.new(-4813.0249, 903.708557, -1912.69055))
                      end
                      if SelectedIsland == "Sky 3st Floor" then
                          two(CFrame.new(-7952.31006, 5545.52832, -320.704956))
                      end
                      if SelectedIsland == "Prison" then
                          two(CFrame.new(4854.16455, 5.68742752, 740.194641))
                      end
                      if SelectedIsland == "Magma Village" then
                          two(CFrame.new(-5231.75879, 8.61593437, 8467.87695))
                      end
                      if SelectedIsland == "UndeyWater City" then
                          two(CFrame.new(61163.8516, 11.7796879, 1819.78418))
                      end
                      if SelectedIsland == "Fountain City" then
                          two(CFrame.new(5132.7124, 4.53632832, 4037.8562))
                      end
                      if SelectedIsland == "House Cyborg's" then
                          two(CFrame.new(6262.72559, 71.3003616, 3998.23047))
                      end
                      if SelectedIsland == "Shank's Room" then
                          two(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
                      end
                      if SelectedIsland == "Mob Island" then
                          two(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
                      end
              elseif world2 then
                      if SelectedIsland == "First Spot" then
                      two(CFrame.new(82.9490662, 18.0710983, 2834.98779))
                      end
                      if SelectedIsland == "Kingdom of Rose" then
                          two(game.Workspace["_WorldOrigin"].Locations["Kingdom of Rose"].CFrame)
                      end
                      if SelectedIsland == "Dark Ares" then
                          two(game.Workspace["_WorldOrigin"].Locations["Dark Arena"].CFrame)
                      end
                      if SelectedIsland == "Flamingo Mansion" then
                          two(CFrame.new(-390.096313, 331.886475, 673.464966))
                      end
                      if SelectedIsland == "Flamingo Room" then
                          two(CFrame.new(2302.19019, 15.1778421, 663.811035))
                      end
                      if SelectedIsland == "Green bit" then
                          two(CFrame.new(-2372.14697, 72.9919434, -3166.51416))
                      end
                      if SelectedIsland == "Cafe" then
                          two(CFrame.new(-385.250916, 73.0458984, 297.388397))
                      end
                      if SelectedIsland == "Factroy" then
                          two(CFrame.new(430.42569, 210.019623, -432.504791))
                      end
                      if SelectedIsland == "Colosseum" then
                          two(CFrame.new(-1836.58191, 44.5890656, 1360.30652))
                      end
                      if SelectedIsland == "Ghost Island" then
                          two(CFrame.new(-5571.84424, 195.182297, -795.432922))
                      end
                      if SelectedIsland == "Ghost Island 2nd" then
                          two(CFrame.new(-5931.77979, 5.19706631, -1189.6908))
                      end
                      if SelectedIsland == "Snow Mountain" then
                          two(CFrame.new(1384.68298, 453.569031, -4990.09766))
                      end
                      if SelectedIsland == "Hot and Cold" then
                          two(CFrame.new(-6026.96484, 14.7461271, -5071.96338))
                      end
                      if SelectedIsland == "Magma Side" then
                          two(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                      end
                      if SelectedIsland == "Cursed Ship" then
                          two(CFrame.new(902.059143, 124.752518, 33071.8125))
                      end
                      if SelectedIsland == "Frosted Island" then
                          two(CFrame.new(5400.40381, 28.21698, -6236.99219))
                      end
                      if SelectedIsland == "Forgotten Island" then
                          two(CFrame.new(-3043.31543, 238.881271, -10191.5791))
                      end
                      if SelectedIsland == "Usoapp Island" then
                          two(CFrame.new(4748.78857, 8.35370827, 2849.57959))
                      end
                      if SelectedIsland == "Minisky Island" then
                       two(CFrame.new(-260.358917, 49325.7031, -35259.3008))     
                      end
                  elseif world3 then
                      if SelectedIsland == "Port Town" then
                          two(CFrame.new(-287, 29.4128036, 5388, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                          end 
                          if SelectedIsland == "Hydra Island" then
                              two(CFrame.new(3399.32227, 72.3884888, 1572.99963, -0.809679806, -4.48284467e-08, 0.586871922, 2.42332163e-08, 1, 1.09818842e-07, -0.586871922, 1.0313989e-07, -0.809679806))
                          end
                          if SelectedIsland == "Castle on the sea" then
                              two(CFrame.new(-5500, 313.768921, -2855, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                          end
                          if SelectedIsland == "Mansion" then
                              two(CFrame.new(-12548, 337.168274, -7481, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                          end
                          if SelectedIsland == "Room Enma/Yama/Secret Temple" then
                              two(CFrame.new(5226.97314, 6.56511164, 1108.5791, 0.998971045, -9.19962631e-08, 0.045356784, 9.01482906e-08, 1, 4.27891926e-08, -0.045356784, -3.86563102e-08, 0.998971045))
                          end
                          if SelectedIsland == "Floating Turtle" then
                              two(CFrame.new(-10016, 331.762634, -8326, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                          end
                          if SelectedIsland == "IceCream" then
                              two(CFrame.new(-880.894531, 118.245354, -11030.7607, -0.867174983, 1.48501234e-09, 0.498003572, 2.70457789e-08, 1, 4.41129586e-08, -0.498003572, 5.1722548e-08, -0.867174983))
                          end
                  
                          if SelectedIsland == "Peanut butter" then
                              two(CFrame.new(-880.894531, 118.245354, -11030.7607, -0.867174983, 1.48501234e-09, 0.498003572, 2.70457789e-08, 1, 4.41129586e-08, -0.498003572, 5.1722548e-08, -0.867174983))
                          end
                          if SelectedIsland == "CakeLoaf" then
                              two(CFrame.new(-1890.27271, 13.8249273, -11578.5898, 0.554632127, -2.0467688e-08, 0.832095683, 1.95285601e-08, 1, 1.15810268e-08, -0.832095683, 9.82642145e-09, 0.554632127))
                          end
              end
          until not _statetp
          _TweenCanCle()
          getgenv().noclip = false
      end 
  end)
  
  
  
  
  local Sector8 = Tab2:CreateSector("Fast Teleport","Right")
  Sector8:AddButton("Castle on the sea",function()
      game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5098.92676, 316.341248, -3113.49243, -0.416183412, 4.72534332e-08, 0.909280717, 2.58240263e-10, 1, -5.18497281e-08, -0.909280717, -2.13441833e-08, -0.416183412)
  end)
  
  Sector8:AddButton("Mansion",function()
      game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12474.4248, 374.940338, -7537.93018, -0.263586283, 4.02929423e-08, 0.964635849, -6.6640049e-09, 1, -4.35910437e-08, -0.964635849, -1.79183388e-08, -0.263586283)
  end)
  
  Sector8:AddButton("Hydra Island",function()
      game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5736.56055, 610.424194, -212.302643, -0.997750342, 4.88476317e-08, 0.0670389384, 5.45859855e-08, 1, 8.3765606e-08, -0.0670389384, 8.72365504e-08, -0.997750342)
  end)
  
  local Sector9 = Tab2:CreateSector("Teleport World","left")
  Sector9:AddButton("Teleport to First World",function()
  local args = {
          [1] = "TravelMain"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)
  
  Sector9:AddButton("Teleport to Second World",function()
   local args = {
          [1] = "DressrosaQuestProgress",
          [2] = "Dressrosa"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      local args = {
          [1] = "TravelDressrosa"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)
  
  Sector9:AddButton("Teleport to Third World",function()
   local args = {
          [1] = "ZQuestProgress",
          [2] = "Zou"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      local args = {
          [1] = "TravelZou"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)
  
  
  local Sector10 = Tab2:CreateSector("Hop & rejoin","Right")
  Sector10:AddButton("rejoin",function()
   local TeleportService = game:GetService("TeleportService")
      TeleportService:Teleport(game.PlaceId)
  end)
  Sector10:AddButton("Hop Server",function()
   HOP()
  end)
  
  Sector10:AddButton("Hop Lower Server",function()
    HopServer()
  end)
  
  
  local Sector11 = Tab1:CreateSector("Abilities","Right")
  
  Sector11:AddButton("Skyjump [ $10,000 Belly ]",function()
  local args = {
          [1] = "BuyHaki",
          [2] = "Geppo"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)
  
  
  Sector11:AddButton("Buso Haki [ $25,000 Belly ]",function()
  local args = {
          [1] = "BuyHaki",
          [2] = "Buso"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)
  
  Sector11:AddButton("Observation haki [ $750,000 Belly ]",function()
   local args = {
          [1] = "KenTalk",
          [2] = "Buy"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)
 
  Sector11:AddToggle("Auto Buy all Abilities", _G.AllEnchant ,function(state)
      _G.AllEnchant = state
  end)
  
  spawn(function()----------buy ability
      while wait(10) do
          pcall(function()
              if _G.AllEnchant then
                  local args = {
                      [1] = "BuyHaki",
                      [2] = "Geppo"
                  }
                  enc1 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                  wait(1)
                  local args = {
                      [1] = "BuyHaki",
                      [2] = "Buso"
                  }
                  enc2 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                  wait(1)
                  local args = {
                      [1] = "BuyHaki",
                      [2] = "Soru"
                  }
                  end3 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
              end
          end)
          if tostring(enc1) == 2 and tostring(enc2) == 2 and tostring(enc3) == 2 then
              break
          end
      end
  end)
  
  spawn(function()
      while wait() do
          if RandomFruit then
              local args = {
                  [1] = "Cousin",
                  [2] = "Buy"
              }
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
              wait(300)
          end
      end
  end)
  
  local Sector12 = Tab3:CreateSector("Join Team","left")
  Sector12:AddButton("Pirate",function()
  local args = {
      [1] = "SetTeam",
      [2] = "Pirates"
  }
  
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)
  
  Sector12:AddButton("Marine",function()
  local args = {
      [1] = "SetTeam",
      [2] = "Marines"
  }
  
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  end)
  
  
  local Sector13 = Tab3:CreateSector("Open Gui","left")
  Sector13:AddButton("Devil Fruit Shop",function()
   local args = {
          [1] = "GetFruits"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
  end)
  
  Sector13:AddButton("Devil Fruit Inventory",function()
    local args = {
          [1] = "getInventoryFruits"
      }
      
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
      game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
  end)
  
  Sector13:AddButton("Inventory",function()
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
      game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
  end)
  
  Sector13:AddButton("Color Haki",function()
     game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
  end)
  
  Sector13:AddButton("Title Name",function()
  local args = {
          [1] = "getTitles"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
  end)
  
  local Sector14 = Tab3:CreateSector("Setting Misc","Right")
  
  if getgenv().fpslock then
      setfpscap(getgenv().fpslock)
  end
  
  
  function checklevel()
      local MYLEVEL = game:GetService("Players").LocalPlayer.Data.Level.Value
      if world1 then
          magbring = 240
          if MYLEVEL == 1 or MYLEVEL <= 9 then
          magbring = 400
          Ms = "Bandit [Lv. 5]"
          NameQuest = "BanditQuest1"
          QuestLv = 1
          NameQ = "Bandit"
          CFrameQ = CFrame.new(1060.61548, 16.5166187, 1546.06348, -0.966731012, 9.64880797e-08, 0.255795151, 8.52720916e-08, 1, -5.49381056e-08, -0.255795151, -3.12981818e-08, -0.966731012)
          CFramePuk = CFrame.new(1094.74158, 68.1195679, 1617.98132, -0.805238843, 2.58748241e-06, -0.592950821, 6.83637325e-07, 1, 3.43534839e-06, 0.592950821, 2.36091159e-06, -0.805238843)
          elseif MYLEVEL == 10 or MYLEVEL <= 14 then
          magbring = 400
          Ms = "Monkey [Lv. 14]"
          NameQuest = "JungleQuest"
          QuestLv = 1
          NameQ = "Monkey"
          CFrameQ = CFrame.new(-1600.24353, 36.8521347, 153.224792, 0.0664860159, 1.09421023e-07, -0.997787356, 9.55680779e-09, 1, 1.10300476e-07, 0.997787356, -1.68691017e-08, 0.0664860159)
          CFramePuk = CFrame.new(-1609.71216, 39.8521576, 123.384674, 0.708323717, 6.74341152e-08, 0.705887735, -1.86098941e-08, 1, -7.68568071e-08, -0.705887735, 4.13030072e-08, 0.708323717)
          elseif MYLEVEL == 15 or MYLEVEL <= 29 then
          magbring = 240
          Ms = "Gorilla [Lv. 20]"
          NameQuest = "JungleQuest"
          QuestLv = 2
          NameQ = "Gorilla"
          CFrameQ = CFrame.new(-1600.24353, 36.8521347, 153.224792, 0.0664860159, 1.09421023e-07, -0.997787356, 9.55680779e-09, 1, 1.10300476e-07, 0.997787356, -1.68691017e-08, 0.0664860159)
          CFramePuk = CFrame.new(-1260.29321, 18.6214619, -398.3508, 0.816335142, 5.76316722e-07, -0.577578545, 8.32609999e-08, 1, 1.11549434e-06, 0.577578545, -9.58707005e-07, 0.816335142)
          elseif MYLEVEL == 30 or MYLEVEL <= 39 then
          Ms = "Pirate [Lv. 35]"
          NameQuest = "BuggyQuest1"
          QuestLv = 1
          NameQ = "Pirate"
          CFrameQ = CFrame.new(-1139.56116, 4.75204945, 3825.97827, -0.947666645, 2.60038924e-08, 0.319261551, 3.65571005e-08, 1, 2.70626153e-08, -0.319261551, 3.73176157e-08, -0.947666645)
          CFramePuk = CFrame.new(-1223.64111, 4.75204945, 3914.84668, -0.99005419, 5.39223821e-09, 0.140686572, -6.35229591e-10, 1, -4.27983267e-08, -0.140686572, -4.24620303e-08, -0.99005419)
          elseif MYLEVEL == 40 or MYLEVEL <= 59 then
          Ms = "Brute [Lv. 45]"
          NameQuest = "BuggyQuest1"
          QuestLv = 2
          NameQ = "Brute"
          CFrameQ = CFrame.new(-1139.56116, 4.75204945, 3825.97827, -0.947666645, 2.60038924e-08, 0.319261551, 3.65571005e-08, 1, 2.70626153e-08, -0.319261551, 3.73176157e-08, -0.947666645)
          CFramePuk = CFrame.new(-1140.92944, 14.8098745, 4317.16455, -0.943479657, 3.71900555e-08, -0.331430465, 1.7316566e-08, 1, 6.2915845e-08, 0.331430465, 5.36205853e-08, -0.943479657)
          elseif MYLEVEL == 60 or MYLEVEL <= 74 then
          Ms = "Desert Bandit [Lv. 60]"
          NameQuest = "DesertQuest"
          QuestLv = 1
          NameQ = "Desert Bandit"
          CFrameQ = CFrame.new(896.408142, 6.43846178, 4389.37891, -0.846945703, -2.31297754e-08, 0.531679392, -1.55507234e-08, 1, 1.87315088e-08, -0.531679392, 7.59657048e-09, -0.846945703)
          CFramePuk = CFrame.new(949.532593, 15.2893953, 4403.09912, -0.832314849, -4.19622452e-08, 0.55430311, 7.94023236e-10, 1, 7.68949704e-08, -0.55430311, 6.44409539e-08, -0.832314849)
          elseif MYLEVEL == 75 or MYLEVEL <= 89 then
          Ms = "Desert Officer [Lv. 70]"
          NameQuest = "DesertQuest"
          QuestLv = 2
          NameQ = "Desert Officer"
          CFrameQ = CFrame.new(896.408142, 6.43846178, 4389.37891, -0.846945703, -2.31297754e-08, 0.531679392, -1.55507234e-08, 1, 1.87315088e-08, -0.531679392, 7.59657048e-09, -0.846945703)
          CFramePuk = CFrame.new(1547.40369, 14.4520388, 4359.40625, 0.228631318, -1.20783e-07, -0.973513126, -3.43095508e-08, 1, -1.32126871e-07, 0.973513126, 6.36091286e-08, 0.228631318)
          elseif MYLEVEL == 90 or MYLEVEL <= 99 then
          Ms = "Snow Bandit [Lv. 90]"
          NameQuest = "SnowQuest"
          QuestLv = 1
          NameQ = "Snow Bandit"
          CFrameQ = CFrame.new(1384.01538, 87.272789, -1296.28137, 0.462413222, -7.79864777e-08, -0.88666451, -1.42050363e-08, 1, -9.53630916e-08, 0.88666451, 5.6692258e-08, 0.462413222)
          CFramePuk = CFrame.new(1372.84326, 105.990303, -1422.19507, 0.719091773, -2.12436309e-08, 0.694915235, 9.82151036e-08, 1, -7.10619616e-08, -0.694915235, 1.19351228e-07, 0.719091773)
          elseif MYLEVEL == 100 or MYLEVEL <= 119 then
          Ms = "Snowman [Lv. 100]"
          NameQuest = "SnowQuest"
          QuestLv = 2
          NameQ = "Snowman"
          CFrameQ = CFrame.new(1384.01538, 87.272789, -1296.28137, 0.462413222, -7.79864777e-08, -0.88666451, -1.42050363e-08, 1, -9.53630916e-08, 0.88666451, 5.6692258e-08, 0.462413222)
          CFramePuk = CFrame.new(1220.92712, 138.011871, -1489.01208, 0.389352709, -7.53626693e-07, 0.921088696, 1.45705499e-07, 1, 7.56600116e-07, -0.921088696, -1.60376572e-07, 0.389352709)
          elseif MYLEVEL == 120 or MYLEVEL <= 149 then
          Ms = "Chief Petty Officer [Lv. 120]"
          NameQuest = "MarineQuest2"
          QuestLv = 1
          NameQ = "Chief Petty Officer"
          CFrameQ = CFrame.new(-5034.64893, 28.6520348, 4324.53369, -0.0616381466, 5.83357576e-08, 0.998098552, -1.59750098e-08, 1, -5.9433436e-08, -0.998098552, -1.96080023e-08, -0.0616381466)
          CFramePuk = CFrame.new(-4863.61328, 22.6520348, 4306.39307, 0.536051273, 7.00434066e-09, -0.844185412, -5.8011751e-10, 1, 7.92878918e-09, 0.844185412, -3.76051057e-09, 0.536051273)
          elseif MYLEVEL == 150 or MYLEVEL <= 174 then
          Ms = "Sky Bandit [Lv. 150]"
          NameQuest = "SkyQuest"
          QuestLv = 1
          NameQ = "Sky Bandit"
          CFrameQ = CFrame.new(-4843.2041, 717.669617, -2623.13159, -0.775086224, -1.6359829e-08, -0.631855488, -4.10942462e-08, 1, 2.45178793e-08, 0.631855488, 4.49690951e-08, -0.775086224)
          CFramePuk = CFrame.new(-4970.74219, 294.544342, -2890.11353, -0.994874597, -8.61311165e-08, -0.101116329, -9.10836278e-08, 1, 4.43614923e-08, 0.101116329, 5.33441664e-08, -0.994874597)
          elseif MYLEVEL == 175 or MYLEVEL <= 189 then
          Ms = "Dark Master [Lv. 175]"
          NameQuest = "SkyQuest"
          QuestLv = 2
          NameQ = "Dark Master"
          CFrameQ = CFrame.new(-4843.2041, 717.669617, -2623.13159, -0.775086224, -1.6359829e-08, -0.631855488, -4.10942462e-08, 1, 2.45178793e-08, 0.631855488, 4.49690951e-08, -0.775086224)
          CFramePuk = CFrame.new(-5239.94629, 392.217102, -2208.18335, 0.969297886, -5.95604988e-09, -0.245889395, 3.87897714e-09, 1, -8.93151775e-09, 0.245889395, 7.70350184e-09, 0.969297886)
          elseif MYLEVEL == 190 or MYLEVEL <= 209 then
          Ms = "Prisoner [Lv. 190]"
          NameQuest = "PrisonerQuest"
          QuestLv = 1
          NameQ = "Prisoner"
          CFrameQ = CFrame.new(5307.95166015625, 1.6809712648391724, 475.1698913574219)
          CFramePuk = CFrame.new(5029.708984375, 68.67806243896484, 445.857177734375)
          elseif MYLEVEL == 210 or MYLEVEL <= 249 then
          Ms = "Dangerous Prisoner [Lv. 210]"
          NameQuest = "PrisonerQuest"
          QuestLv = 2
          NameQ = "Dangerous Prisoner"
          CFrameQ = CFrame.new(5307.95166015625, 1.6809712648391724, 475.1698913574219)
          CFramePuk = CFrame.new(5673.51758, 68.6786652, 783.757629, -0.0514698699, 7.78369369e-08, 0.998674572, 8.35602094e-08, 1, -7.36337e-08, -0.998674572, 7.96595359e-08, -0.0514698699)
          elseif MYLEVEL == 250 or MYLEVEL <= 274 then
          Ms = "Toga Warrior [Lv. 250]"
          NameQuest = "ColosseumQuest"
          QuestLv = 1
          NameQ = "Toga Warrior"
          CFrameQ = CFrame.new(-1575.72961, 7.38933659, -2983.39453, 0.52762109, -1.48187587e-06, 0.849479854, 2.69328297e-07, 1, 1.57716818e-06, -0.849479854, -6.0335816e-07, 0.52762109)
          CFramePuk = CFrame.new(-1819.12415, 7.28907108, -2744.02539, 0.547199547, 2.10840998e-08, -0.837002158, -1.27399286e-10, 1, 2.51067309e-08, 0.837002158, -1.36317579e-08, 0.547199547)
          elseif MYLEVEL == 275 or MYLEVEL <= 299 then
          Ms = "Gladiator [Lv. 275]"
          NameQuest = "ColosseumQuest"
          QuestLv = 2
          NameQ = "Gladiator"
          CFrameQ = CFrame.new(-1575.72961, 7.38933659, -2983.39453, 0.52762109, -1.48187587e-06, 0.849479854, 2.69328297e-07, 1, 1.57716818e-06, -0.849479854, -6.0335816e-07, 0.52762109)
          CFramePuk = CFrame.new(-1334.76514, 7.44254398, -3228.90552, -0.340173125, 2.8230156e-08, 0.940362811, 2.60959143e-09, 1, -2.90764834e-08, -0.940362811, -7.4370754e-09, -0.340173125)
          elseif MYLEVEL == 300 or MYLEVEL <= 324 then
          Ms = "Military Soldier [Lv. 300]"
          NameQuest = "MagmaQuest"
          QuestLv = 1
          NameQ = "Military Soldier"
          CFrameQ = CFrame.new(-5316.33887, 12.236989, 8517.67285, 0.499506682, -5.08374072e-08, -0.86631006, -1.30872131e-08, 1, -6.62286652e-08, 0.86631006, 4.44192452e-08, 0.499506682)
          CFramePuk = CFrame.new(-5419.0752, 10.9255161, 8464.50488, -0.637788415, -4.55103836e-05, 0.770211577, 7.05542743e-06, 1, 6.49305366e-05, -0.770211577, 4.68461185e-05, -0.637788415)
          elseif MYLEVEL == 325 or MYLEVEL <= 374 then
          Ms = "Military Spy [Lv. 325]"
          NameQuest = "MagmaQuest"
          QuestLv = 2
          NameQ = "Military Spy"
          CFrameQ = CFrame.new(-5316.33887, 12.236989, 8517.67285, 0.499506682, -5.08374072e-08, -0.86631006, -1.30872131e-08, 1, -6.62286652e-08, 0.86631006, 4.44192452e-08, 0.499506682)
          CFramePuk = CFrame.new(-5805.42041, 99.5276108, 8782.36719, -0.316935152, -6.4923519e-08, 0.948447227, 4.12987404e-08, 1, 8.2252896e-08, -0.948447227, 6.52385026e-08, -0.316935152)
          elseif MYLEVEL == 375 or MYLEVEL <= 399 then
          Ms = "Fishman Warrior [Lv. 375]"
          NameQuest = "FishmanQuest"
          QuestLv = 1
          NameQ = "Fishman Warrior"
          CFrameQ = CFrame.new(61122.2422, 18.4716377, 1568.84778, 0.971045971, -1.77007031e-08, 0.238892734, 4.80190776e-09, 1, 5.45760841e-08, -0.238892734, -5.18487475e-08, 0.971045971)
          CFramePuk = CFrame.new(60898.043, 18.4828224, 1550.9906, -0.0750192106, -4.46996573e-09, 0.997182071, 3.6461556e-10, 1, 4.51002746e-09, -0.997182071, 7.0192685e-10, -0.0750192106)
          if getgenv().Config.autofarmlevel and (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
          end
          elseif MYLEVEL == 400 or MYLEVEL <= 449 then
          Ms = "Fishman Commando [Lv. 400]"
          NameQuest = "FishmanQuest"
          QuestLv = 2
          NameQ = "Fishman Commando"
          CFrameQ = CFrame.new(61122.2422, 18.4716377, 1568.84778, 0.971045971, -1.77007031e-08, 0.238892734, 4.80190776e-09, 1, 5.45760841e-08, -0.238892734, -5.18487475e-08, 0.971045971)
          CFramePuk = CFrame.new(61885.4063, 18.4828224, 1500.37195, 0.722261012, 4.84021889e-08, -0.691620588, 1.27929427e-08, 1, 8.33434299e-08, 0.691620588, -6.90435726e-08, 0.722261012)
          if getgenv().Config.autofarmlevel and (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
          end
          elseif MYLEVEL == 450 or MYLEVEL <= 474 then
          Ms = "God's Guard [Lv. 450]"
          NameQuest = "SkyExp1Quest"
          QuestLv = 1
          NameQ = "God's Guard"
          CFrameQ = CFrame.new(-4721.28369, 845.277161, -1954.95154, -0.979754269, -1.72096932e-08, 0.200205252, -2.52417198e-09, 1, 7.36076018e-08, -0.200205252, 7.16119786e-08, -0.979754269)
          CFramePuk = CFrame.new(-4630.00635, 866.902954, -1936.76331, -0.656243384, 9.12737941e-12, 0.754549265, 3.58402819e-09, 1, 3.10498938e-09, -0.754549265, 4.74195483e-09, -0.656243384)
          if getgenv().Config.autofarmlevel and (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
          end
          elseif MYLEVEL == 475 or MYLEVEL <= 524 then
          Ms = "Shanda [Lv. 475]"
          NameQuest = "SkyExp1Quest"
          QuestLv = 2
          NameQ = "Shanda"
          CFrameQ = CFrame.new(-7861.79736, 5545.49316, -379.920776, 0.504107952, -1.41941534e-08, -0.863640666, -1.31181936e-08, 1, -2.40923566e-08, 0.863640666, 2.34745521e-08, 0.504107952)
          CFramePuk = CFrame.new(-7682.69775, 5607.36279, -445.691833, 0.786274791, -4.48163426e-08, -0.617877364, -4.81674345e-09, 1, -7.86622607e-08, 0.617877364, 6.48263239e-08, 0.786274791)
          if getgenv().Config.autofarmlevel and (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
          end
          elseif MYLEVEL == 525 or MYLEVEL <= 549 then
          Ms = "Royal Squad [Lv. 525]"
          NameQuest = "SkyExp2Quest"
          QuestLv = 1
          NameQ = "Royal Squad"
          CFrameQ = CFrame.new(-7902.23242, 5635.96387, -1411.96741, -0.0435957126, -2.13718043e-09, 0.999049246, 4.23562352e-10, 1, 2.15769735e-09, -0.999049246, 5.1722604e-10, -0.0435957126)
          CFramePuk = CFrame.new(-7579.42285, 5628.39111, -1540.75073, -0.0374937952, 1.17099557e-08, 0.999296963, -3.30279164e-08, 1, -1.29574085e-08, -0.999296963, -3.34905081e-08, -0.0374937952)
          elseif MYLEVEL == 550 or MYLEVEL <= 624 then
          Ms = "Royal Soldier [Lv. 550]"
          NameQuest = "SkyExp2Quest"
          QuestLv = 2
          NameQ = "Royal Soldier"
          CFrameQ = CFrame.new(-7902.23242, 5635.96387, -1411.96741, -0.0435957126, -2.13718043e-09, 0.999049246, 4.23562352e-10, 1, 2.15769735e-09, -0.999049246, 5.1722604e-10, -0.0435957126)
          CFramePuk = CFrame.new(-7834.84717, 5681.36182, -1790.76782, -0.102890432, 3.28112684e-08, 0.994692683, -6.45397762e-08, 1, -3.96622966e-08, -0.994692683, -6.82781121e-08, -0.102890432)
          elseif MYLEVEL == 625 or MYLEVEL <= 649 then
          Ms = "Galley Pirate [Lv. 625]"
          NameQuest = "FountainQuest"
          QuestLv = 1
          NameQ = "Galley Pirate"
          CFrameQ = CFrame.new(5254.52734, 38.5011368, 4049.80127, -0.0732342899, 2.23174847e-08, -0.997314751, 1.2052287e-07, 1, 1.35274023e-08, 0.997314751, -1.19208565e-07, -0.0732342899)
          CFramePuk = CFrame.new(5597.58936, 41.5013657, 3960.55371, -0.584786832, 4.98908861e-08, 0.811187029, 4.10757259e-08, 1, -3.18919575e-08, -0.811187029, 1.4670098e-08, -0.584786832)
          elseif MYLEVEL >= 650 then
          Ms = "Galley Captain [Lv. 650]"
          NameQuest = "FountainQuest"
          QuestLv = 2
          NameQ = "Galley Captain"
          CFrameQ = CFrame.new(5254.52734, 38.5011368, 4049.80127, -0.0732342899, 2.23174847e-08, -0.997314751, 1.2052287e-07, 1, 1.35274023e-08, 0.997314751, -1.19208565e-07, -0.0732342899)
          CFramePuk = CFrame.new(5705.8252, 52.241478, 4890.11035, -0.969319642, 4.40228476e-09, 0.245803744, -7.88622412e-09, 1, -4.90088397e-08, -0.245803744, -4.94436954e-08, -0.969319642)    
          end
          end
          if world2 then
              magbring = 400
          if MYLEVEL == 700 or MYLEVEL <= 724 then
          Ms = "Raider [Lv. 700]"
          NameQuest = "Area1Quest"
          QuestLv = 1
          NameQ = "Raider"
          CFrameQ = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
          CFramePuk = CFrame.new(-141.872437, 96.6845093, 2491.01538, 0.13152431, 0, -0.991312981, -0, 1.00000012, -0, 0.991312981, 0, 0.13152431)
          elseif MYLEVEL == 725 or MYLEVEL <= 774 then
          Ms = "Mercenary [Lv. 725]"
          NameQuest = "Area1Quest"
          QuestLv = 2
          NameQ = "Mercenary"
          CFrameQ = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
          CFramePuk = CFrame.new(-938.497314, 80.9546738, 1443.98608, 0.231955677, 0, 0.972726345, -0, 1, -0, -0.972726345, 0, 0.231955677)
          elseif MYLEVEL == 775 or MYLEVEL <= 874 then
          Ms = "Swan Pirate [Lv. 775]"
          NameQuest = "Area2Quest"
          QuestLv = 1
          NameQ = "Swan Pirate"
          CFrameQ = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
          CFramePuk = CFrame.new(967.233276, 141.309494, 1210.06384, 0.999673784, 5.40161649e-09, -0.0255404469, -7.62258967e-09, 1, -8.68617107e-08, 0.0255404469, 8.7028063e-08, 0.999673784)
          elseif MYLEVEL == 875 or MYLEVEL <= 899 then
          Ms = "Marine Lieutenant [Lv. 875]"
          NameQuest = "MarineQuest3"
          QuestLv = 1
          NameQ = "Marine Lieutenant."
          CFrameQ = CFrame.new(-2443.04639, 73.0161057, -3220.30225, -0.854058921, -6.13997599e-08, -0.520176232, -1.30658604e-08, 1, -9.65840883e-08, 0.520176232, -7.56919505e-08, -0.854058921)
          CFramePuk = CFrame.new(-2967.00757, 72.9661407, -2972.7478, 0.977851391, 8.27619218e-08, -0.209300488, -6.95268412e-08, 1, 7.05923142e-08, 0.209300488, -5.44767893e-08, 0.977851391)
          elseif MYLEVEL == 900 or MYLEVEL <= 949 then
          Ms = "Marine Captain [Lv. 900]"
          NameQuest = "MarineQuest3"
          QuestLv = 2
          NameQ = "Marine Captain"
          CFrameQ = CFrame.new(-2443.04639, 73.0161057, -3220.30225, -0.854058921, -6.13997599e-08, -0.520176232, -1.30658604e-08, 1, -9.65840883e-08, 0.520176232, -7.56919505e-08, -0.854058921)
          CFramePuk = CFrame.new(-1818.36401, 93.3760834, -3203.57788, 0.315930545, 4.84752114e-08, 0.948782325, 1.37578589e-08, 1, -5.56731905e-08, -0.948782325, 3.06420738e-08, 0.315930545)
          elseif MYLEVEL == 950 or MYLEVEL <= 974 then
          Ms = "Zombie [Lv. 950]"
          NameQuest = "ZombieQuest"
          QuestLv = 1
          NameQ = "Zombie"
          CFrameQ = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
          CFramePuk = CFrame.new(-5736.03516, 126.031998, -728.026184, 0.0818082988, -5.90035434e-08, 0.996648133, 3.5947787e-09, 1, 5.89069167e-08, -0.996648133, -1.23634614e-09, 0.0818082988)
          elseif MYLEVEL == 975 or MYLEVEL <= 999 then
          Ms = "Vampire [Lv. 975]"
          NameQuest = "ZombieQuest"
          QuestLv = 2
          NameQ = "Vampire"
          CFrameQ = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
          CFramePuk = CFrame.new(-6028.23584, 6.40270138, -1295.4563, 0.667547405, 0, 0.744567394, -0, 1.00000012, -0, -0.744567394, 0, 0.667547405)
          elseif MYLEVEL == 1000 or MYLEVEL <= 1049 then
          Ms = "Snow Trooper [Lv. 1000]"
          NameQuest = "SnowMountainQuest"
          QuestLv = 1
          NameQ = "Snow Trooper"
          CFrameQ = CFrame.new(605.670532, 401.422028, -5370.10107, 0.459257662, -9.56824509e-10, -0.888303101, 5.98925964e-10, 1, -7.67489405e-10, 0.888303101, -1.79552401e-10, 0.459257662)
          CFramePuk = CFrame.new(544.207947, 401.422028, -5309.08887, 0.503866196, -2.06684501e-08, 0.86378175, 1.27917943e-09, 1, 2.31816841e-08, -0.86378175, -1.05755351e-08, 0.503866196)
          elseif MYLEVEL == 1050 or MYLEVEL <= 1099 then
          Ms = "Winter Warrior [Lv. 1050]"
          NameQuest = "SnowMountainQuest"
          QuestLv = 2
          NameQ = "Winter Warrior"
          CFrameQ = CFrame.new(605.670532, 401.422028, -5370.10107, 0.459257662, -9.56824509e-10, -0.888303101, 5.98925964e-10, 1, -7.67489405e-10, 0.888303101, -1.79552401e-10, 0.459257662)
          CFramePuk = CFrame.new(1240.86279, 461.108154, -5191.104, 0.528719008, -7.18234645e-08, 0.848796904, 2.89169716e-10, 1, 8.44378363e-08, -0.848796904, -4.4398444e-08, 0.528719008)
          elseif MYLEVEL == 1100 or MYLEVEL <= 1124 then
          Ms = "Lab Subordinate [Lv. 1100]"
          NameQuest = "IceSideQuest"
          QuestLv = 1
          NameQ = "Lab Subordinate"
          CFrameQ = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
          CFramePuk = CFrame.new(-5833.63379, 48.4371948, -4510.4458, 0.0372838341, 5.56001822e-09, -0.999304712, -6.95599089e-09, 1, 5.30436006e-09, 0.999304712, 6.75338763e-09, 0.0372838341)
          elseif MYLEVEL == 1125 or MYLEVEL <= 1174 then
          Ms = "Horned Warrior [Lv. 1125]"
          NameQuest = "IceSideQuest"
          QuestLv = 2
          NameQ = "Horned Warrior"
          CFrameQ = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
          CFramePuk = CFrame.new(-6168.15918, 42.7079964, -6020.96826, -0.744210601, 2.41774178e-09, -0.667945027, -2.3336304e-09, 1, 6.21975493e-09, 0.667945027, 6.18754425e-09, -0.744210601)
          elseif MYLEVEL == 1175 or MYLEVEL <= 1199 then
          Ms = "Magma Ninja [Lv. 1175]"
          NameQuest = "FireSideQuest"
          QuestLv = 1
          NameQ = "Magma Ninja"
          CFrameQ = CFrame.new(-5429.68359, 15.9517593, -5296.70215, 0.919959962, -6.00166317e-08, -0.392012328, 2.29238974e-08, 1, -9.93018858e-08, 0.392012328, 8.23673076e-08, 0.919959962)
          CFramePuk = CFrame.new(-5404.85449, 22.8623676, -5896.09033, -0.519595861, 4.74720929e-09, 0.854412138, 1.52255595e-08, 1, 3.70304742e-09, -0.854412138, 1.49329917e-08, -0.519595861)
          if getgenv().Config.autofarmlevel and (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5466.8896484375, 15.951756477356, -5212.197265625))
          end
          elseif MYLEVEL == 1200 or MYLEVEL <= 1249 then
          Ms = "Lava Pirate [Lv. 1200]"
          NameQuest = "FireSideQuest"
          QuestLv = 2
          NameQ = "Lava Pirate"
          CFrameQ = CFrame.new(-5429.68359, 15.9517593, -5296.70215, 0.919959962, -6.00166317e-08, -0.392012328, 2.29238974e-08, 1, -9.93018858e-08, 0.392012328, 8.23673076e-08, 0.919959962)
          CFramePuk = CFrame.new(-5075.1958, 16.1485081, -4814.36133, -0.800640523, -1.06090866e-07, 0.599145055, -6.59776447e-08, 1, 8.89041587e-08, -0.599145055, 3.16500923e-08, -0.800640523)
          elseif MYLEVEL == 1250 or MYLEVEL <= 1274 then
          Ms = "Ship Deckhand [Lv. 1250]"
          NameQuest = "ShipQuest1" 
          QuestLv = 1
          NameQ = "Ship Deckhand"
          CFrameQ = CFrame.new(1038.67456, 125.057098, 32911.3477, 0.120709591, 5.22710089e-08, -0.992687881, 7.9174507e-09, 1, 5.36187876e-08, 0.992687881, -1.43318593e-08, 0.120709591)
          CFramePuk = CFrame.new(1215.14063, 125.057114, 33050.7188, 0.527230442, 2.61814961e-08, 0.849722326, -5.66963045e-08, 1, 4.36674741e-09, -0.849722326, -5.04783984e-08, 0.527230442)
          if getgenv().Config.autofarmlevel and (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
          end
          elseif MYLEVEL == 1275 or MYLEVEL <= 1299 then
          Ms = "Ship Engineer [Lv. 1275]"
          NameQuest = "ShipQuest1" 
          QuestLv = 2
          NameQ = "Ship Engineer"
          CFrameQ = CFrame.new(1038.67456, 125.057098, 32911.3477, 0.120709591, 5.22710089e-08, -0.992687881, 7.9174507e-09, 1, 5.36187876e-08, 0.992687881, -1.43318593e-08, 0.120709591)
          CFramePuk = CFrame.new(862.985413, 40.4428635, 32867.9492, -0.847809434, 8.49998827e-08, -0.530301034, 2.99658929e-08, 1, 1.1237865e-07, 0.530301034, 7.93847335e-08, -0.847809434)
          if getgenv().Config.autofarmlevel and (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
          end
          elseif MYLEVEL == 1300 or MYLEVEL <= 1324 then
          Ms = "Ship Steward [Lv. 1300]"
          NameQuest = "ShipQuest2" 
          QuestLv = 1
          NameQ = "Ship Steward"
          CFrameQ = CFrame.new(969.268311, 125.057121, 33245.2695, -0.85863924, -4.77058464e-08, -0.512580395, -1.49134394e-08, 1, -6.80880134e-08, 0.512580395, -5.08187057e-08, -0.85863924)
          CFramePuk = CFrame.new(923.611511, 129.555984, 33442.3125, 0.997516274, 9.71936913e-08, 0.0704362914, -9.52239958e-08, 1, -3.13219992e-08, -0.0704362914, 2.45369804e-08, 0.997516274)
          if getgenv().Config.autofarmlevel and (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
          end
          elseif MYLEVEL == 1325 or MYLEVEL <= 1349 then
          Ms = "Ship Officer [Lv. 1325]"
          NameQuest = "ShipQuest2" 
          QuestLv = 2
          NameQ = "Ship Officer"
          CFrameQ = CFrame.new(969.268311, 125.057121, 33245.2695, -0.85863924, -4.77058464e-08, -0.512580395, -1.49134394e-08, 1, -6.80880134e-08, 0.512580395, -5.08187057e-08, -0.85863924)
          CFramePuk = CFrame.new(882.275574, 181.057739, 33354.1797, 0.845816016, -3.71928088e-08, -0.533474684, 1.28583932e-09, 1, -6.7679359e-08, 0.533474684, 5.65583242e-08, 0.845816016)
          if getgenv().Config.autofarmlevel and (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
          end
          elseif MYLEVEL == 1350 or MYLEVEL <= 1374 then
          Ms = "Arctic Warrior [Lv. 1350]"
          NameQuest = "FrostQuest" 
          QuestLv = 1
          NameQ = "Arctic Warrior"
          CFrameQ = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
          CFramePuk = CFrame.new(5995.9292, 57.0727844, -6184.98926, 0.706337512, 5.23128296e-09, -0.707875192, -2.2285974e-08, 1, -1.48474424e-08, 0.707875192, 2.62629936e-08, 0.706337512)
          if getgenv().Config.autofarmlevel and (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
          end
          elseif MYLEVEL == 1375 or MYLEVEL <= 1424 then
          Ms = "Snow Lurker [Lv. 1375]"
          NameQuest = "FrostQuest" 
          QuestLv = 2
          NameQ = "Snow Lurker"
          CFrameQ = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
          CFramePuk = CFrame.new(5516.27539, 60.5209846, -6830.82764, 0.219563305, -7.8544824e-09, 0.975598276, 4.69439376e-09, 1, 6.99444236e-09, -0.975598276, 3.04411962e-09, 0.219563305)
          elseif MYLEVEL == 1425 or MYLEVEL <= 1449 then
          Ms = "Sea Soldier [Lv. 1425]"
          NameQuest = "ForgottenQuest" 
          QuestLv = 1
          NameQ = "Sea Soldier"
          CFrameQ = CFrame.new(-3053.97339, 236.846283, -10146.1484, -0.999963522, -2.10707256e-08, -0.00854360498, -2.09657198e-08, 1, -1.23802275e-08, 0.00854360498, -1.22006529e-08, -0.999963522)
          CFramePuk = CFrame.new(-3026.54834, 29.5403671, -9758.74316, -0.999909937, 1.71713896e-08, -0.0134194754, 1.68009748e-08, 1, 2.7715517e-08, 0.0134194754, 2.74875607e-08, -0.999909937)
          if getgenv().Config.autofarmlevel and (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
          end
          elseif MYLEVEL >= 1450  then
          Ms = "Water Fighter [Lv. 1450]"
          NameQuest = "ForgottenQuest" 
          QuestLv = 2
          NameQ = "Water Fighter"
          CFrameQ = CFrame.new(-3053.97339, 236.846283, -10146.1484, -0.999963522, -2.10707256e-08, -0.00854360498, -2.09657198e-08, 1, -1.23802275e-08, 0.00854360498, -1.22006529e-08, -0.999963522)
          CFramePuk = CFrame.new(-3262.00098, 298.699615, -10553.6943, -0.233570755, -4.57538185e-08, 0.972339869, -5.80986068e-08, 1, 3.30992194e-08, -0.972339869, -4.87605725e-08, -0.233570755)
          end 
          end
          if world3 then
              magbring = 400
          if MYLEVEL == 1500 or MYLEVEL <= 1524 then
          Ms = "Pirate Millionaire [Lv. 1500]"
          NameQuest = "PiratePortQuest" 
          QuestLv = 1
          NameQ = "Pirate Millionaire"
          CFrameQ = CFrame.new(-288.688629, 43.7932091, 5578.0918, -0.980135322, 4.04644034e-08, 0.198329896, 5.16003063e-08, 1, 5.0980109e-08, -0.198329896, 6.02012875e-08, -0.980135322)
          CFramePuk = CFrame.new(-362.372589, 116.311394, 5690.42188, 0.982939184, -1.16153336e-08, -0.183930904, 1.35050096e-08, 1, 9.02115538e-09, 0.183930904, -1.13512355e-08, 0.982939184)
          elseif MYLEVEL == 1525 or MYLEVEL <= 1574 then
          Ms = "Pistol Billionaire [Lv. 1525]"
          NameQuest = "PiratePortQuest" 
          QuestLv = 2
          NameQ = "Pistol Billionaire"
          CFrameQ = CFrame.new(-288.688629, 43.7932091, 5578.0918, -0.980135322, 4.04644034e-08, 0.198329896, 5.16003063e-08, 1, 5.0980109e-08, -0.198329896, 6.02012875e-08, -0.980135322)
          CFramePuk = CFrame.new(-238.026596, 219.645935, 6007.1748, 0.902000248, -1.08513618e-07, -0.431735516, 9.17130407e-08, 1, -5.97320096e-08, 0.431735516, 1.42825076e-08, 0.902000248)
          elseif MYLEVEL == 1575 or MYLEVEL <= 1599 then
          Ms = "Dragon Crew Warrior [Lv. 1575]"
          NameQuest = "AmazonQuest" 
          QuestLv = 1
          NameQ = "Dragon Crew Warrior"
          CFrameQ = CFrame.new(5833.72559, 51.3513527, -1104.3147, -0.958539188, -3.53234562e-08, 0.284960806, -3.93179853e-08, 1, -8.29718783e-09, -0.284960806, -1.91572642e-08, -0.958539188)
          CFramePuk = CFrame.new(6210.00977, 51.4822731, -1187.48975, 0.208473638, 2.79291683e-08, -0.978027999, -6.3442954e-08, 1, 1.50332973e-08, 0.978027999, 5.89149387e-08, 0.208473638)
          elseif MYLEVEL == 1600 or MYLEVEL <= 1624 then
          Ms = "Dragon Crew Archer [Lv. 1600]"
          NameQuest = "AmazonQuest" 
          QuestLv = 2
          NameQ = "Dragon Crew Archer"
          CFrameQ = CFrame.new(5833.72559, 51.3513527, -1104.3147, -0.958539188, -3.53234562e-08, 0.284960806, -3.93179853e-08, 1, -8.29718783e-09, -0.284960806, -1.91572642e-08, -0.958539188)
          CFramePuk = CFrame.new(6672.1167, 386.634491, 102.138634, -0.879578114, 4.99873778e-08, 0.475754529, -1.44054524e-09, 1, -1.07732973e-07, -0.475754529, -9.54449106e-08, -0.879578114)
          elseif MYLEVEL == 1625 or MYLEVEL <= 1649 then
          Ms = "Female Islander [Lv. 1625]"
          NameQuest = "AmazonQuest2" 
          QuestLv = 1
          NameQ = "Female Islander"
          CFrameQ = CFrame.new(5445.99756, 601.603638, 750.611145, -0.0389447734, 1.17245778e-08, -0.999241352, 1.19459349e-08, 1, 1.12678942e-08, 0.999241352, -1.1498047e-08, -0.0389447734)
          CFramePuk = CFrame.new(4660.0293, 793.07666, 771.150757, -0.300044596, 6.91594604e-09, -0.953925192, -9.75659518e-08, 1, 3.79380722e-08, 0.953925192, 1.04453733e-07, -0.300044596)
          elseif MYLEVEL == 1650 or MYLEVEL <= 1699 then
          Ms = "Giant Islander [Lv. 1650]"
          NameQuest = "AmazonQuest2" 
          QuestLv = 2
          NameQ = "Giant Islander"
          CFrameQ = CFrame.new(5445.99756, 601.603638, 750.611145, -0.0389447734, 1.17245778e-08, -0.999241352, 1.19459349e-08, 1, 1.12678942e-08, 0.999241352, -1.1498047e-08, -0.0389447734)
          CFramePuk = CFrame.new(5013.77881, 664.0849, -42.7317543, 0.793121755, 2.98509946e-08, 0.609063148, -3.13217008e-08, 1, -8.22422486e-09, -0.609063148, -1.25540822e-08, 0.793121755)
          elseif MYLEVEL == 1700 or MYLEVEL <= 1724 then
          Ms = "Marine Commodore [Lv. 1700]"
          NameQuest = "MarineTreeIsland" 
          QuestLv = 1
          NameQ = "Marine Commodore"
          CFrameQ = CFrame.new(2179.58447, 28.7054367, -6738.48682, 0.97564882, -2.54533923e-08, -0.219338506, 1.31742075e-08, 1, -5.74454191e-08, 0.219338506, 5.31569455e-08, 0.97564882)
          CFramePuk = CFrame.new(2548.86279, 124.071259, -7774.8999, -0.790427029, -1.174846e-08, -0.612556159, -2.99833545e-08, 1, 1.95103667e-08, 0.612556159, 3.37880124e-08, -0.790427029)
          elseif MYLEVEL == 1725 or MYLEVEL <= 1774 then
          Ms = "Marine Rear Admiral [Lv. 1725]"
          NameQuest = "MarineTreeIsland" 
          QuestLv = 2
          NameQ = "Marine Rear Admiral"
          CFrameQ = CFrame.new(2179.58447, 28.7054367, -6738.48682, 0.97564882, -2.54533923e-08, -0.219338506, 1.31742075e-08, 1, -5.74454191e-08, 0.219338506, 5.31569455e-08, 0.97564882)
          CFramePuk = CFrame.new(3582.24365, 160.524048, -7055.01416, -0.182099551, 6.68982807e-08, -0.983280122, 8.52377937e-08, 1, 5.22501367e-08, 0.983280122, -7.42978941e-08, -0.182099551)
          elseif MYLEVEL == 1775 or MYLEVEL <= 1799 then
          Ms = "Fishman Raider [Lv. 1775]"
          NameQuest = "DeepForestIsland3" 
          QuestLv = 1
          NameQ = "Fishman Raider"
          CFrameQ = CFrame.new(-10582.666, 331.762634, -8758.61035, 0.919332206, 1.69593086e-08, -0.393482327, -3.42409479e-08, 1, -3.68999942e-08, 0.393482327, 4.73965578e-08, 0.919332206)
          CFramePuk = CFrame.new(-10449.9258, 331.762634, -8475.85742, -0.739984214, -8.96819241e-09, 0.67262423, -5.59647688e-08, 1, -4.82362239e-08, -0.67262423, -7.33373042e-08, -0.739984214)
          elseif MYLEVEL == 1800 or MYLEVEL <= 1824 then
          Ms = "Fishman Captain [Lv. 1800]"
          NameQuest = "DeepForestIsland3" 
          QuestLv = 2
          NameQ = "Fishman Captain"
          CFrameQ = CFrame.new(-10582.666, 331.762634, -8758.61035, 0.919332206, 1.69593086e-08, -0.393482327, -3.42409479e-08, 1, -3.68999942e-08, 0.393482327, 4.73965578e-08, 0.919332206)
          CFramePuk = CFrame.new(-11035.9189, 331.762634, -8966.12012, -0.199661195, 8.05780545e-08, -0.979865015, -2.36975328e-08, 1, 8.70625314e-08, 0.979865015, 4.06033926e-08, -0.199661195)
          elseif MYLEVEL == 1825 or MYLEVEL <= 1849 then
          Ms = "Forest Pirate [Lv. 1825]"
          NameQuest = "DeepForestIsland" 
          QuestLv = 1
          NameQ = "Forest Pirate"
          CFrameQ = CFrame.new(-13232.082, 332.378143, -7627.49121, -0.717027605, -4.07509866e-08, 0.69704479, 3.86317822e-08, 1, 9.8201788e-08, -0.69704479, 9.734147e-08, -0.717027605)
          CFramePuk = CFrame.new(-13438.9268, 417.009583, -7767.28467, -0.301585436, -7.02043721e-08, -0.953439176, -4.40521433e-08, 1, -5.96985004e-08, 0.953439176, 2.39968401e-08, -0.301585436)
          elseif MYLEVEL == 1850 or MYLEVEL <= 1899 then
          Ms = "Mythological Pirate [Lv. 1850]"
          NameQuest = "DeepForestIsland" 
          QuestLv = 2
          NameQ = "Mythological Pirate"
          CFrameQ = CFrame.new(-13232.082, 332.378143, -7627.49121, -0.717027605, -4.07509866e-08, 0.69704479, 3.86317822e-08, 1, 9.8201788e-08, -0.69704479, 9.734147e-08, -0.717027605)
          CFramePuk = CFrame.new(-13560.6543, 522.013672, -6733.91113, 0.996960402, -1.61884088e-08, 0.0779099241, 1.91753653e-08, 1, -3.75904605e-08, -0.0779099241, 3.89701533e-08, 0.996960402)
          elseif MYLEVEL == 1900 or MYLEVEL <= 1924 then
          Ms = "Jungle Pirate [Lv. 1900]"
          NameQuest = "DeepForestIsland2" 
          QuestLv = 1
          NameQ = "Jungle Pirate"
          CFrameQ = CFrame.new(-12683.9668, 390.860687, -9901.30176, 0.152271122, 4.28084199e-08, -0.988338768, -4.4882615e-08, 1, 3.63985464e-08, 0.988338768, 3.88167827e-08, 0.152271122)
          CFramePuk = CFrame.new(-11983.4141, 375.940613, -10459.2383, 0.999999106, 1.88226306e-08, 0.00133047614, -1.87607263e-08, 1, -4.65408618e-08, -0.00133047614, 4.65158578e-08, 0.999999106)
         elseif MYLEVEL == 1925 or MYLEVEL <= 1974 then
             Ms = "Musketeer Pirate [Lv. 1925]"
             NameQuest = "DeepForestIsland2" 
             QuestLv = 2
             NameQ = "Musketeer Pirate"
             CFrameQ = CFrame.new(-12683.9668, 390.860687, -9901.30176, 0.152271122, 4.28084199e-08, -0.988338768, -4.4882615e-08, 1, 3.63985464e-08, 0.988338768, 3.88167827e-08, 0.152271122)
             CFramePuk = CFrame.new(-13293.082, 520.447632, -9901.99316, -0.758020341, -6.61346249e-08, 0.652230918, -2.15839417e-08, 1, 7.63127872e-08, -0.652230918, 4.37689316e-08, -0.758020341)
            elseif MYLEVEL == 1975 or MYLEVEL <= 1999 then
                Ms = "Reborn Skeleton [Lv. 1975]"
                NameQuest = "HauntedQuest1" 
                QuestLv = 1
                NameQ = "Reborn Skeleton"
                CFrameQ = CFrame.new(-9481.97754, 142.104843, 5566.03662, 0.00151404156, -4.14115426e-08, -0.999998868, -3.46592838e-10, 1, -4.14121146e-08, 0.999998868, 4.092921e-10, 0.00151404156)
                CFramePuk = CFrame.new(-8762.2832, 185.188904, 6169.08057, 0.964605391, 2.60655728e-08, 0.263697594, -2.23583552e-08, 1, -1.70596284e-08, -0.263697594, 1.05599645e-08, 0.964605391)
            elseif MYLEVEL == 2000 or MYLEVEL <= 2024 then
                Ms = "Living Zombie [Lv. 2000]"
                NameQuest = "HauntedQuest1" 
                QuestLv = 2
                NameQ = "Living Zombie"
                CFrameQ = CFrame.new(-9481.97754, 142.104843, 5566.03662, 0.00151404156, -4.14115426e-08, -0.999998868, -3.46592838e-10, 1, -4.14121146e-08, 0.999998868, 4.092921e-10, 0.00151404156)
                CFramePuk = CFrame.new(-10081.085, 237.834961, 5913.92871, 0.0515871011, 9.59092787e-08, 0.998668492, 4.31864713e-08, 1, -9.82679822e-08, -0.998668492, 4.81983271e-08, 0.0515871011)
            elseif MYLEVEL == 2025 or MYLEVEL <= 2049 then
                Ms = "Demonic Soul [Lv. 2025]"
                NameQuest = "HauntedQuest2" 
                QuestLv = 1
                NameQ = "Demonic Soul"
                CFrameQ = CFrame.new(-9513.68945, 172.104813, 6078.30811, 0.06916935, 2.37454696e-08, 0.997604907, 1.21678923e-07, 1, -3.22391358e-08, -0.997604907, 1.23617454e-07, 0.06916935)
                CFramePuk = CFrame.new(-9661.06152, 234.989151, 6208.34473, 0.839007735, 1.00638069e-07, -0.544119537, -9.42643013e-08, 1, 3.9604533e-08, 0.544119537, 1.80625381e-08, 0.839007735)
            elseif MYLEVEL == 2050 or MYLEVEL <= 2074 then
                Ms = "Posessed Mummy [Lv. 2050]"
                NameQuest = "HauntedQuest2" 
                QuestLv = 2
                NameQ = "Posessed Mummy"
                CFrameQ = CFrame.new(-9513.68945, 172.104813, 6078.30811, 0.06916935, 2.37454696e-08, 0.997604907, 1.21678923e-07, 1, -3.22391358e-08, -0.997604907, 1.23617454e-07, 0.06916935)
                CFramePuk = CFrame.new(-9555.10254, 66.3880768, 6371.47021, 0.993915081, -2.2833456e-08, 0.110149056, 2.02630606e-08, 1, 2.44549945e-08, -0.110149056, -2.20742304e-08, 0.993915081)
              elseif MYLEVEL == 2075 or MYLEVEL <= 2099 then
                  Ms = "Peanut Scout [Lv. 2075]"
                  NameQuest = "NutsIslandQuest" 
                  QuestLv = 1
                  NameQ = "Peanut Scout"
                  CFrameQ = CFrame.new(-2103.03442, 38.103981, -10192.5801, 0.779485822, -2.70350977e-08, 0.626419842, -3.08562882e-08, 1, 8.15541483e-08, -0.626419842, -8.2899291e-08, 0.779485822)
                  CFramePuk = CFrame.new(-2149.84937, 122.471855, -10359.0498, -0.0922852308, -3.50682292e-08, -0.995732605, 3.04092396e-09, 1, -3.55003564e-08, 0.995732605, -6.30410568e-09, -0.0922852308)
             elseif MYLEVEL == 2100 or MYLEVEL <= 2124 then
                  Ms = "Peanut President [Lv. 2100]"
                  NameQuest = "NutsIslandQuest" 
                  QuestLv = 2
                  NameQ = "Peanut President"
                  CFrameQ = CFrame.new(-2103.03442, 38.103981, -10192.5801, 0.779485822, -2.70350977e-08, 0.626419842, -3.08562882e-08, 1, 8.15541483e-08, -0.626419842, -8.2899291e-08, 0.779485822)
                  CFramePuk = CFrame.new(-2149.84937, 122.471855, -10359.0498, -0.0922852308, -3.50682292e-08, -0.995732605, 3.04092396e-09, 1, -3.55003564e-08, 0.995732605, -6.30410568e-09, -0.0922852308)
              elseif MYLEVEL == 2125 or MYLEVEL <= 2149 then
                  Ms = "Ice Cream Chef [Lv. 2125]"
                  NameQuest = "IceCreamIslandQuest" 
                  QuestLv = 1
                  NameQ = "Ice Cream Chef"
                  CFrameQ = CFrame.new(-823.195129, 65.8453369, -10963.583, 0.367210746, -2.2831804e-08, -0.930137753, 2.00119876e-09, 1, -2.37566322e-08, 0.930137753, 6.86230051e-09, 0.367210746)
                  CFramePuk = CFrame.new(-846.166931, 205.853973, -11006.5137, -0.153710946, 3.34348504e-09, 0.988115847, -4.13023145e-08, 1, -9.80867032e-09, -0.988115847, -4.23191722e-08, -0.153710946)
              elseif MYLEVEL == 2150 or MYLEVEL <= 2199 then
                  Ms = "Ice Cream Commander [Lv. 2150]"
                  NameQuest = "IceCreamIslandQuest" 
                  QuestLv = 2
                  NameQ = "Ice Cream Commander"
                  CFrameQ = CFrame.new(-823.195129, 65.8453369, -10963.583, 0.367210746, -2.2831804e-08, -0.930137753, 2.00119876e-09, 1, -2.37566322e-08, 0.930137753, 6.86230051e-09, 0.367210746)
                  CFramePuk = CFrame.new(-846.166931, 205.853973, -11006.5137, -0.153710946, 3.34348504e-09, 0.988115847, -4.13023145e-08, 1, -9.80867032e-09, -0.988115847, -4.23191722e-08, -0.153710946)
              elseif MYLEVEL == 2200 or MYLEVEL <= 2224 then
                  Ms = "Cookie Crafter [Lv. 2200]"
                  NameQuest = "CakeQuest1" 
                  QuestLv = 1
                  NameQ = "Cookie Crafter"
                  CFrameQ = CFrame.new(-2021.3193359375, 37.82402038574219, -12027.6845703125)
                  CFramePuk = CFrame.new(-2288.84717, 93.943161, -12046.7285, 0.0389619507, -8.05070766e-09, 0.999240696, 1.44159458e-08, 1, 7.49472484e-09, -0.999240696, 1.41129908e-08, 0.0389619507)
              elseif MYLEVEL == 2225 or MYLEVEL <= 2249 then
                  Ms = "Cake Guard [Lv. 2225]"
                  NameQuest = "CakeQuest1" 
                  QuestLv = 2
                  NameQ = "Cake Guard"
                  CFrameQ = CFrame.new(-2021.3193359375, 37.82402038574219, -12027.6845703125)
                  CFramePuk = CFrame.new(-1600.24854, 195.694992, -12346.0342, -0.9457618, -7.09395209e-08, -0.32486099, -9.57561568e-08, 1, 6.04042683e-08, 0.32486099, 8.82354882e-08, -0.9457618)
              elseif MYLEVEL == 2250 or MYLEVEL <= 2274 then
                  Ms = "Baking Staff [Lv. 2250]"
                  NameQuest = "CakeQuest2" 
                  QuestLv = 1
                  NameQ = "Baking Staff"
                  CFrameQ = CFrame.new(-1928.67395, 37.8331604, -12842.3936, -0.235107109, -7.40617239e-08, -0.971969485, -7.00571334e-08, 1, -5.92516507e-08, 0.971969485, 5.41629106e-08, -0.235107109)
                  CFramePuk = CFrame.new(-1848.26746, 186.937271, -13007.0479, 0.460077673, 6.23081897e-09, -0.887878656, -9.55947232e-09, 1, 2.06415507e-09, 0.887878656, 7.53797913e-09, 0.460077673)
              elseif MYLEVEL >= 2275 then
                  Ms = "Head Baker [Lv. 2275]"
                  NameQuest = "CakeQuest2" 
                  QuestLv = 2
                  NameQ = "Head Baker"
                  CFrameQ = CFrame.new(-1928.67395, 37.8331604, -12842.3936, -0.235107109, -7.40617239e-08, -0.971969485, -7.00571334e-08, 1, -5.92516507e-08, 0.971969485, 5.41629106e-08, -0.235107109)
                  CFramePuk = CFrame.new(-2012.3689, 177.257675, -12839.6357, 0.759093106, 4.20168478e-09, -0.650982082, 1.84710747e-10, 1, 6.66976474e-09, 0.650982082, -5.18321563e-09, 0.759093106)  
                elseif MyLevel == 2301 or MyLevel <= 2324 then
                    Mon = "Cocoa Warrior [Lv. 2300]"
                    LevelQuest = 1
                    NameQuest = "ChocQuest1"
                    NameMon = "Cocoa Warrior"
                    CFrameQuest = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
                    CFramePuk = CFrame.new(-103.987442, 141.551514, -12260.2188, 0.589523733, -3.54913752e-08, -0.80775106, 4.28455316e-08, 1, -1.26684059e-08, 0.80775106, -2.71401959e-08, 0.589523733)
                elseif MyLevel == 2325 or MyLevel <= 2349 then
                    Mon = "Chocolate Bar Battler [Lv. 2325]"
                    LevelQuest = 2
                    NameQuest = "ChocQuest1"
                    NameMon = "Chocolate Bar Battler"
                    CFrameQuest = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
                    CFramePuk = CFrame.new(617.304688, 80.6076355, -12580.6494, -0.485228658, 3.42073503e-09, -0.874387324, -4.0368306e-08, 1, 2.63139608e-08, 0.874387324, 4.80658215e-08, -0.485228658)
                elseif MyLevel == 2350 or MyLevel <= 2374 then
                    Mon = "Sweet Thief [Lv. 2350]"
                    LevelQuest = 1
                    NameQuest = "ChocQuest2"
                    NameMon = "Sweet Thief"
                    CFrameQuest = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)         
                    CFramePuk = CFrame.new(72.062767, 77.630722, -12640.4287, -0.62450999, -9.80953416e-08, 0.781016827, 1.42118917e-09, 1, 1.26735927e-07, -0.781016827, 8.02578199e-08, -0.62450999)
                elseif MyLevel == 2375 or MyLevel <= 2400 then
                    Mon = "Candy Rebel [Lv. 2375]"
                    LevelQuest = 2
                    NameQuest = "ChocQuest2"
                    NameMon = "Candy Rebel"
                    CFrameQuest = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
                    CFramePuk = CFrame.new(420.127747, 109.63044, -12989.6035, 0.0957952142, 3.10210027e-08, 0.995401084, -9.46955225e-09, 1, -3.02529948e-08, -0.995401084, -6.52791066e-09, 0.0957952142)
                end
            end
        end
  
  checklevel()
  ----------------------------------------
  
  spawn(function()---auto superhuman
      while wait(.1) do
      if getgenv().automelee.superhuman then
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
      local args = {
      [1] = "BuyBlackLeg"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end   
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw")  then
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
         _G.SelectWeapon = "Black Leg"
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
         _G.SelectWeapon = "Electro"
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
         _G.SelectWeapon = "Fishman Karate"
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
         _G.SelectWeapon = "Dragon Claw"
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Superhuman") then
          _G.SelectWeapon = "Superhuman"
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
      local args = {
      [1] = "BuyElectro"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
      local args = {
      [1] = "BuyElectro"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
      local args = {
      [1] = "BuyFishmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
      local args = {
      [1] = "BuyFishmanKarate"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
      local args = {
      [1] = "BlackbeardReward",
      [2] = "DragonClaw",
      [3] = "1"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      local args = {
      [1] = "BlackbeardReward",
      [2] = "DragonClaw",
      [3] = "2"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
      local args = {
      [1] = "BlackbeardReward",
      [2] = "DragonClaw",
      [3] = "1"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      local args = {
      [1] = "BlackbeardReward",
      [2] = "DragonClaw",
      [3] = "2"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
      end
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
      local args = {
      [1] = "BuySuperhuman"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
      local args = {
      [1] = "BuySuperhuman"
      }
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      end
      end
      end
      end
  end)
  
  function buso() --- use buso haki
      if(not(game.Players.LocalPlayer.Character:FindFirstChild('HasBuso')))then
          game.ReplicatedStorage.Remotes.CommF_:InvokeServer('Buso')
      end
  end
  
  spawn(function()---auto haki
      while task.wait() do
          pcall(function()
              if getgenv().Config.buso then
                  buso() 
              end
              if getgenv().Config.ken then
                  if game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                  else wait(1)
                      game:service('VirtualUser'):CaptureController()
                      game:service('VirtualUser'):SetKeyDown('0x65')
                      wait(2)
                      game:service('VirtualUser'):SetKeyUp('0x65')
                  end 
              end
          end)
      end
  end)
  
  
  function keydown(use)
      game:GetService("VirtualInputManager"):SendKeyEvent(true,use,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
      wait(.1)
      game:GetService("VirtualInputManager"):SendKeyEvent(false,use,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
  end
  
  local numpos = 0
  function bypasstp(x)
      spawn(function()
          while task.wait() do
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = x
              if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == x then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
              end
              numpos = numpos + 1
              if numpos == 5 then
                  game.Players.LocalPlayer.Character.Humanoid.Health = 0
                  numpos=0
                  break
              end
              task.wait()
          end
      end)
  end
  
  function equip(typ) --- equip tool
      for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
          if(v:IsA('Tool'))then
              if(v.ToolTip==typ or v.Name==typ )then
                  game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
              end
          end
      end
  end
  
  function distance(targetpos) --- distance form Position
      return(game.Players.LocalPlayer:DistanceFromCharacter(targetpos))
  end
  
  function doingquest() --- checkquest
      return(game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible)
  end
  
  posrandom = 0
  randomposenelfastfarm = 0
  
  spawn(function()---new autofarm
      while task.wait() do
          pcall(function()
              if getgenv().Config.autofarmlevel then
                          if (doingquest()==false) then
                              checklevel()
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                              if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude <= 1500 then
                                  two(CFrameQ)
                              else
                                  bypasstp(CFrameQ)
                                  if FarmStat then
                                      _TweenCanCle()
                                      getgenv().Config.autofarmlevel = false
                                      FarmStat = false
                                      task.wait(25)
                                      getgenv().Config.autofarmlevel = true
                                      FarmStat = true
                                  end
                              end
                              getgenv().noclip = true
                              equip(getgenv().Config.selectweapon)
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                              local distance_Quest = (CFrameQ.Position - game.Players.localPlayer.Character.HumanoidRootPart.Position).Magnitude 
                              if distance_Quest <= 20 then
                                  game.ReplicatedStorage.Remotes.CommF_:InvokeServer('StartQuest', NameQuest, QuestLv)
                              end
                          elseif (doingquest()==true) then
                              checklevel()
                              if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                                  checklevel()
                                  for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                      checklevel()
                                      if v.Name == Ms and v:FindFirstChild("Humanoid") then
                                          checklevel()
                                          if v.Humanoid.Health > 0 then
                                              checklevel()
                                              repeat task.wait()
                                                  if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,NameQ) then
                                                      checklevel()
                                                      if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                                                          checklevel()
                                                          _groupMon = true
                                                          UseFast = true
                                                          getgenv().noclip = true
                                                          equip(getgenv().Config.selectweapon)
                                                          spawn(function()
                                                              if posrandom <= 1 then
                                                                  two(v.HumanoidRootPart.CFrame * CFrame.new(0,10,50))
                                                                  posrandom = posrandom + 0.1
                                                              elseif posrandom >= 1 and posrandom <= 2 then
                                                                  two(v.HumanoidRootPart.CFrame * CFrame.new(50,10,0))
                                                                  posrandom = posrandom + 0.1
                                                              elseif posrandom >= 2 and posrandom <= 3 then
                                                                  two(v.HumanoidRootPart.CFrame *CFrame.new(0,10,-50))
                                                                  posrandom = posrandom + 0.1
                                                              elseif posrandom >= 3 and posrandom <= 4  then
                                                                  two(v.HumanoidRootPart.CFrame * CFrame.new(-50,10,0))
                                                                  posrandom = posrandom + 0.1
                                                              elseif posrandom >=4 and posrandom <= 5 then
                                                                  two(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                                                  posrandom = 0
                                                              end
                                                          end)
                                                          PosMon = v.HumanoidRootPart.CFrame
                                                          v.Humanoid.JumpPower = 0
                                                          v.Humanoid.WalkSpeed = 0
                                                          v.Humanoid.Sit = true
                                                          v.HumanoidRootPart.CanCollide = false
                                                          v.Humanoid:ChangeState(14)
                                                          sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                                                          if not getgenv().Config.fastattack then
                                                              game:GetService'VirtualUser':CaptureController()
                                                              game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672)) 
                                                          end   
                                                      end
                                                  else
                                                      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer('AbandonQuest')
                                                  end
                                              until not v.Parent or v.Humanoid.Health <= 0 or getgenv().Config.autofarmlevel == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(Ms)
                                              _groupMon = false
                                              UseFast = false
                                              getgenv().noclip = false
                                              checklevel()
                                          end
                                      end
                                  end
                                  else
                                      if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFramePuk.Position).magnitude >= 600 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFramePuk.Position).magnitude <= 1500 then
                                      checklevel()
                                      two(CFramePuk)
                                      UnEquipWeapon(getgenv().Config.selectweapon)
                                      elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Postion - CFramePuk.Position).magnitude >= 1500 then
                                      checklevel()
                                      bypasstp(CFramePuk)
                                      UnEquipWeapon(getgenv().Config.selectweapon)
                                      if FarmStat then
                                      _TweenCanCle()
                                      getgenv().Config.autofarmlevel = false
                                      UnEquipWeapon(getgenv().Config.selectweapon)
                                      FarmStat = false
                                      task.wait(1.5)
                                      getgenv().Config.autofarmlevel = true
                                      FarmStat = true
                                      end
                                      end
                                      _groupMon = false
                                      UseFast = false
                                  end
                          end
              end
          end)
      end
  end)
  
  if getgenv().noclip then
      local a = Instance.new('Part',workspace)
      --
      local a = Instance.new("Part")
      a.Name = "epicbingus"
      a.Parent = game.Workspace
      a.Anchored = true 
      a.Transparency = 1
      a.Size = Vector3.new(10,0.5,10) 
  end
  ---
  game:GetService("RunService").Heartbeat:Connect(function()
     pcall(function()
     if not game:GetService("Workspace"):FindFirstChild("epicbingus") and getgenv().noclip then
      local a = Instance.new("Part")
      a.Name = "epicbingus"
      a.Parent = game.Workspace
      a.Anchored = true 
      a.Transparency = 1
      a.Size = Vector3.new(40,0.5,40)
          end
     end)
  end)
  
  function changestate()
     game.Workspace["epicbingus"].CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,-4,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
  end
  
  spawn(function()
      game:GetService("RunService").Heartbeat:Connect(function()
          pcall(function()
              if getgenv().noclip then
                  if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y < 0 then
                      changestate()
                  end
              end
          end)
      end)
  end)
  
    
    local plr = game.Players.LocalPlayer
    
    local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
    local CbFw2 = CbFw[2]
    
    function GetCurrentBlade() 
        local p13 = CbFw2.activeController
        local ret = p13.blades[1]
        if not ret then return end
        while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
        return ret
    end
    function AttackNoCD() 
        local AC = CbFw2.activeController
        for i = 1, 1 do 
            local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                plr.Character,
                {plr.Character.HumanoidRootPart},
                60
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    table.insert(cac, v.Parent.HumanoidRootPart)
                    hash[v.Parent] = true
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                local u8 = debug.getupvalue(AC.attack, 5)
                local u9 = debug.getupvalue(AC.attack, 6)
                local u7 = debug.getupvalue(AC.attack, 4)
                local u10 = debug.getupvalue(AC.attack, 7)
                local u12 = (u8 * 798405 + u7 * 727595) % u9
                local u13 = u7 * 798405
                (function()
                    u12 = (u12 * u9 + u13) % 1099511627776
                    u8 = math.floor(u12 / u9)
                    u7 = u12 - u8 * u9
                end)()
                u10 = u10 + 1
                debug.setupvalue(AC.attack, 5, u8)
                debug.setupvalue(AC.attack, 6, u9)
                debug.setupvalue(AC.attack, 4, u7)
                debug.setupvalue(AC.attack, 7, u10)
                pcall(function()
                    for k, v in pairs(AC.animator.anims.basic) do
                        v:Play()
                    end                  
                end)
                if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
                end
            end
        end
    end
    
  require(game.ReplicatedStorage.Util.CameraShaker):Stop()
  spawn(function()
    while task.wait() do
          pcall(function()
              if UseFast then
                  if getgenv().Config.fastattack then
                    AttackNoCD() 
                  end
              end
          end)
        end
  end)
  
  local VirtualUser = game:GetService('VirtualUser')
  spawn(function()---------- anti afk
      game:GetService("Players").LocalPlayer.Idled:connect(function()
          pcall(function()
              VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
              task.wait(1)
              VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
          end)
      end)
  end)
  
  spawn(function()------body velocity
      game:GetService("RunService").Stepped:Connect(function()
          if getgenv().Config.autofarmlevel or getgenv().Config.autonewworld or _statetp or getgenv().noclip or _autocakeprince then
              if not game.Players.localPlayer.Character.HumanoidRootPart:FindFirstChild('bv') then
                  local bv = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character.HumanoidRootPart)
                  bv.Name = 'bv'
                  bv.MaxForce = Vector3.new(100000,100000,100000)
                  bv.Velocity = Vector3.new(0,0,0)
              end
          else
              if game.Players.localPlayer.Character.HumanoidRootPart:FindFirstChild('bv') then
                  game.Players.localPlayer.Character.HumanoidRootPart:FindFirstChild('bv'):Destroy()
              end
           end
      end)
  end)
  
  _groupMon = false
  
  spawn(function()
      game:GetService("RunService").Heartbeat:Connect(function()
          pcall(function()
              if (getgenv().Config.autofarmlevel) and _groupMon then
                  checklevel()
                  for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                      if v.Name ~= "Ice Admiral [Lv. 700] [Boss]" and v.Name ~= "Don Swan [Lv. 3000] [Boss]" and v.Name ~= "Saber Expert [Lv. 200] [Boss]" and v.Name ~= "Longma [Lv. 2000] [Boss]" and (v.HumanoidRootPart.Position-PosMon.Position).magnitude <= magbring then
                          if syn then
                          v.HumanoidRootPart.CFrame = PosMon
                          v.Humanoid.JumpPower = 0
                          v.Humanoid.WalkSpeed = 0
                          v.Humanoid.Sit = true
                          v.HumanoidRootPart.CanCollide = false
                          if v.Humanoid:FindFirstChild("Animator") then
                              v.Humanoid.Animator:Destroy()
                          end
                          sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                          v.Humanoid:ChangeState(14)
                          v.Humanoid:ChangeState(11)
                      else
                          v.HumanoidRootPart.CFrame = PosMon
                          v.Humanoid.JumpPower = 0
                          v.Humanoid.WalkSpeed = 0
                          v.Humanoid.Sit = true
                          v.HumanoidRootPart.CanCollide = false
                          if v.Humanoid:FindFirstChild("Animator") then
                              v.Humanoid.Animator:Destroy()
                          end
                          sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                          v.Humanoid:ChangeState(14)
                          v.Humanoid:ChangeState(11)
                          end
                      end
                  end
              end
          end)
      end)
  end)
  
  spawn(function()--critical damage
      local backup = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
      local Crit = getupvalues(backup)[2]
      local CombatFrameworkR = getupvalues(backup)[2]
      local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
      function maxincrement()
          return #Crit.activeController.anims.basic
      end
      spawn(function()
          local old
          old = hookmetamethod(game, "__namecall",function(self,...)
              local method = getnamecallmethod() local args = {...}
      
              if method:lower() == "fireserver" then
                  if args[1] == "hit" then
                      args[3] = maxincrement()
                      return old(self,unpack(args))
                  end end
              return old(self,...)
          end) 
      end)
  end)
  
  game:GetService("RunService").Heartbeat:Connect(function()
      pcall(function()
          if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
              if getgenv().noclip then
                  setfflag("HumanoidParallelRemoveNoPhysics", "False")
                  setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                  game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
              end
          end
      end)
  end)
