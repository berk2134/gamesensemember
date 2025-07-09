-- Skeet-style CS:GO Loader Panel - Roblox GUI (Geliştirilmiş)

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "CSGOLoaderMenu"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- Ana Outline (çerçeve)
local outline = Instance.new("Frame", screenGui)
outline.Size = UDim2.new(0, 550, 0, 320) -- genişlik +20, yükseklik +20
outline.Position = UDim2.new(0.5, -275, 0.5, -160)
outline.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
outline.BorderSizePixel = 0

-- İç Arka Plan
local inner = Instance.new("Frame", outline)
inner.Size = UDim2.new(1, -4, 1, -4)
inner.Position = UDim2.new(0, 2, 0, 2)
inner.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
inner.BorderSizePixel = 0

-- Üstteki Skeet Gradient
local gradientBar = Instance.new("ImageLabel", inner)
gradientBar.Size = UDim2.new(1, 0, 0, 4)
gradientBar.Position = UDim2.new(0, 0, 0, 0)
gradientBar.Image = "rbxassetid://8508019876"
gradientBar.BackgroundTransparency = 1
gradientBar.ImageColor3 = Color3.fromRGB(255, 255, 255)

-- Sol Oyun Listesi Kutusu
local gameList = Instance.new("Frame", inner)
gameList.Size = UDim2.new(0.6, -10, 0.55, -10)
gameList.Position = UDim2.new(0, 10, 0, 20)
gameList.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
gameList.BorderColor3 = Color3.fromRGB(10, 10, 10)
gameList.BorderSizePixel = 1
gameList.ClipsDescendants = true

-- Sağdaki Seçenekler
local optionsBox = Instance.new("Frame", inner)
optionsBox.Size = UDim2.new(0.35, 0, 0.55, -10)
optionsBox.Position = UDim2.new(0.63, 0, 0, 20)
optionsBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
optionsBox.BorderColor3 = Color3.fromRGB(10, 10, 10)
optionsBox.BorderSizePixel = 1

local loadBtn = Instance.new("TextButton", optionsBox)
loadBtn.Size = UDim2.new(1, -20, 0, 40)
loadBtn.Position = UDim2.new(0, 10, 0, 20)
loadBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
loadBtn.Text = "Load"
loadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
loadBtn.Font = Enum.Font.Code
loadBtn.TextSize = 16
loadBtn.BorderColor3 = Color3.fromRGB(60, 60, 60)
loadBtn.AutoButtonColor = true

local exitBtn = loadBtn:Clone()
exitBtn.Parent = optionsBox
exitBtn.Position = UDim2.new(0, 10, 0, 80)
exitBtn.Text = "Exit"

-- Alt Status Kutusu (daha uzun yapıldı)
local statusBox = Instance.new("Frame", inner)
statusBox.Size = UDim2.new(1, -20, 0.4, -20) -- yükseklik 0.4 yapıldı
statusBox.Position = UDim2.new(0, 10, 0.6, 10) -- biraz daha aşağı kaydırıldı
statusBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
statusBox.BorderColor3 = Color3.fromRGB(10, 10, 10)
statusBox.BorderSizePixel = 1

local statusLabel = Instance.new("TextLabel", statusBox)
statusLabel.Size = UDim2.new(1, -10, 1, -10)
statusLabel.Position = UDim2.new(0, 5, 0, 5)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = '<font color="rgb(0,255,0)">Connected</font>\nWelcome back, Toggle\nAdded Counter Blox: Global Offensive (Subscription)\nAdded Arsenal (Subscription)\nYour session expires in 3 minutes'
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.Font = Enum.Font.Code
statusLabel.TextSize = 13
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.TextYAlignment = Enum.TextYAlignment.Top
statusLabel.RichText = true
statusLabel.TextWrapped = true
statusLabel.TextTransparency = 0

-- Oyunlar listesi tablosu
local games = {
    {
        Name = "Counter-Blox: Global Offensive",
        Subtitle = "Updated 09.07.2025 22:32",
        Icon = "rbxassetid://129203877714411",
        ScriptUrl = "https://raw.githubusercontent.com/berk2134/gamesensemember/refs/heads/main/gamesense.lua",
    },
    {
        Name = "Arsenal",
        Subtitle = "Updated 09.07.2025 22:35",
        Icon = "rbxassetid://112211049037368", -- R6 icon örnek
        ScriptUrl = "https://raw.githubusercontent.com/berk2134/gamesensemember/refs/heads/main/r6.lua",
    },
    -- İstersen buraya yenilerini ekleyebilirsin
}

-- Seçilen oyun indexi
local selectedIndex = nil

-- Fonksiyon: Seçimi güncelle
local function updateSelection(newIndex)
    selectedIndex = newIndex
    for i, gameFrame in ipairs(gameList:GetChildren()) do
        if gameFrame:IsA("Frame") then
            if i == newIndex then
                gameFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70) -- seçilen koyu vurgulu arka plan
            else
                gameFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            end
        end
    end
end

-- Oyun listesi GUI elemanlarını oluştur
for i, gameInfo in ipairs(games) do
    local gameFrame = Instance.new("Frame", gameList)
    gameFrame.Size = UDim2.new(1, 0, 0, 40)
    gameFrame.Position = UDim2.new(0, 0, 0, (i - 1) * 45)
    gameFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    gameFrame.BorderSizePixel = 0

    -- İkon
    local icon = Instance.new("ImageLabel", gameFrame)
    icon.Size = UDim2.new(0, 30, 0, 30)
    icon.Position = UDim2.new(0, 5, 0.5, -15)
    icon.BackgroundTransparency = 1
    icon.Image = gameInfo.Icon

    -- Başlık
    local titleLabel = Instance.new("TextLabel", gameFrame)
    titleLabel.Size = UDim2.new(1, -40, 0, 20)
    titleLabel.Position = UDim2.new(0, 40, 0, 3)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = gameInfo.Name
    titleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    titleLabel.Font = Enum.Font.Code
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextYAlignment = Enum.TextYAlignment.Top

    -- Alt yazı (subtitle)
    local subLabel = Instance.new("TextLabel", gameFrame)
    subLabel.Size = UDim2.new(1, -40, 0, 15)
    subLabel.Position = UDim2.new(0, 40, 0, 22)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = "<font color=\"rgb(120,120,120)\">" .. gameInfo.Subtitle .. "</font>"
    subLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    subLabel.Font = Enum.Font.Code
    subLabel.TextSize = 12
    subLabel.RichText = true
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.TextYAlignment = Enum.TextYAlignment.Top

    -- Tıklama ile seçme
    gameFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            updateSelection(i)
        end
    end)
end

-- Load butonuna tıklanınca
loadBtn.MouseButton1Click:Connect(function()
    if not selectedIndex then
        statusLabel.Text = "<font color=\"rgb(255,0,0)\">Please select a game first!</font>"
        return
    end

    local selectedGame = games[selectedIndex]
    statusLabel.Text = '<font color="rgb(255,255,0)">Injecting ' .. selectedGame.Name .. '...</font>'

    -- Raw script yükleme ve çalıştırma
    local success, err = pcall(function()
        local scriptCode = game:HttpGet(selectedGame.ScriptUrl)
        loadstring(scriptCode)()
    end)

    if success then
        statusLabel.Text = '<font color="rgb(0,255,0)">Injected ' .. selectedGame.Name .. ' successfully!</font>'
        task.delay(3, function()
            screenGui:Destroy()
        end)
    else
        statusLabel.Text = '<font color="rgb(255,0,0)">Injection failed: ' .. tostring(err) .. '</font>'
    end
end)

-- Exit butonuna tıklanınca menüyü kapat
exitBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
