-- ===============================================
-- NEXUS SCRIPT - GUI TEMPLATE (Rayfield)
-- КЛЮЧИ: FREE2026, NEXUS2026
-- ===============================================

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local GameName = "Roblox Game"
pcall(function()
    local placeInfo = MarketplaceService:GetProductInfo(game.PlaceId)
    GameName = placeInfo.Name
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nexus ULTRA | " .. GameName,
   Icon = 0,
   LoadingTitle = "Загрузка Nexus Menu...",
   LoadingSubtitle = "by Nexus Team",
   ConfigurationSaving = { Enabled = false },
   Discord = { Enabled = false },
   KeySystem = true,
   KeySettings = {
      Title = "Nexus Script | Key System",
      Subtitle = "Введите ключ доступа",
      Note = "Ключ: FREE2026",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"FREE2026", "NEXUS2026"}
   }
})

-- Копирование ссылки в буфер при запуске
setclipboard("https://t.me/super_vip_chat")

Rayfield:Notify({
   Title = "Nexus ULTRA",
   Content = "Запущено! Ссылка на TG скопирована.",
   Duration = 4,
   Image = 4483345998
})

-- ===============================================
-- ВКЛАДКА 1: ГЛАВНОЕ МЕНЮ
-- ===============================================
local MainTab = Window:CreateTab("Главное меню 🏠", 4483345998)

MainTab:CreateSection("Информационные функции")

MainTab:CreateButton({
   Name = "📢 Скопировать Telegram канал",
   Callback = function()
      setclipboard("https://t.me/super_vip_chat")
      Rayfield:Notify({Title = "Nexus", Content = "Ссылка скопирована в буфер!", Duration = 3})
   end,
})

MainTab:CreateSlider({
   Name = "⚡️ Настройка скорости (Speed)",
   Range = {16, 200},
   Increment = 1,
   Suffix = "WalkSpeed",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
         LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

MainTab:CreateSlider({
   Name = "🦘 Сила прыжка (Jump)",
   Range = {50, 300},
   Increment = 1,
   Suffix = "JumpPower",
   CurrentValue = 50,
   Flag = "JumpSlider",
   Callback = function(Value)
      if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
         LocalPlayer.Character.Humanoid.JumpPower = Value
      end
   end,
})

-- ===============================================
-- ВКЛАДКА 2: ДОПОЛНИТЕЛЬНО
-- ===============================================
local ExtraTab = Window:CreateTab("Дополнительно 🛠", 4483345998)

ExtraTab:CreateButton({
   Name = "📊 Показать FPS и Пинг",
   Callback = function()
      local stats = game:GetService("Stats")
      local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
      local ping = math.floor(stats.Network.ServerStatsItem["Data Ping"]:GetValue())
      
      Rayfield:Notify({
         Title = "Статистика",
         Content = "FPS: " .. tostring(fps) .. " | Ping: " .. tostring(ping) .. "ms",
         Duration = 4
      })
   end,
})
