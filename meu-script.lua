-- CONFIGURAÇÃO:
local KEY_URL = "https://raw.githubusercontent.com/githubcute/secret-bypass1/main/keys.txt" -- link do seu keys.txt
local LINK_SITE_KEY = "https://www.roblox.com/share?code=3b0a5698d40498449d84429eefb1978e&type=Server" -- troque pelo seu site de key

-- Função para buscar keys válidas do GitHub
local function getKeys()
    local resp = game:HttpGet(KEY_URL)
    local keys = {}
    for key in string.gmatch(resp, "[^\r\n]+") do
        keys[#keys+1] = key
    end
    return keys
end

local function isValidKey(tryKey)
    local keys = getKeys()
    for _, key in ipairs(keys) do
        if key == tryKey then
            return true
        end
    end
    return false
end

-- GUI estilizada igual ao modelo da sua imagem
local gui = Instance.new("ScreenGui")
gui.Name = "SecretBypassKey"
gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 350, 0, 220)
frame.Position = UDim2.new(0.5, -175, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(32,32,32)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(0,0,0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)

local UIStroke = Instance.new("UIStroke", frame)
UIStroke.Color = Color3.fromRGB(0,0,0)
UIStroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Text = "SECRET BYPASS"
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(0,0,0)

local keyBox = Instance.new("TextBox", frame)
keyBox.PlaceholderText = "Enter Key"
keyBox.Size = UDim2.new(0.85, 0, 0, 36)
keyBox.Position = UDim2.new(0.5, -0.5*0.85*350, 0, 60)
keyBox.Font = Enum.Font.SourceSans
keyBox.TextSize = 20
keyBox.Text = ""
keyBox.BackgroundColor3 = Color3.fromRGB(180,180,180)
keyBox.TextColor3 = Color3.fromRGB(0,0,0)
keyBox.BorderSizePixel = 0
local keyCorner = Instance.new("UICorner", keyBox)
keyCorner.CornerRadius = UDim.new(0,8)

local result = Instance.new("TextLabel", frame)
result.Size = UDim2.new(1, 0, 0, 28)
result.Position = UDim2.new(0, 0, 0, 100)
result.BackgroundTransparency = 1
result.Text = ""
result.Font = Enum.Font.SourceSans
result.TextSize = 18
result.TextColor3 = Color3.fromRGB(180, 0, 0)

local accessBtn = Instance.new("TextButton", frame)
accessBtn.Text = "Acess Script"
accessBtn.Size = UDim2.new(0.85, 0, 0, 36)
accessBtn.Position = UDim2.new(0.5, -0.5*0.85*350, 0, 135)
accessBtn.Font = Enum.Font.SourceSansBold
accessBtn.TextSize = 20
accessBtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
accessBtn.TextColor3 = Color3.fromRGB(0,0,0)
accessBtn.BorderSizePixel = 0
local accessCorner = Instance.new("UICorner", accessBtn)
accessCorner.CornerRadius = UDim.new(0,8)

local getKeyBtn = Instance.new("TextButton", frame)
getKeyBtn.Text = "Get Key"
getKeyBtn.Size = UDim2.new(0.85, 0, 0, 36)
getKeyBtn.Position = UDim2.new(0.5, -0.5*0.85*350, 0, 180)
getKeyBtn.Font = Enum.Font.SourceSansBold
getKeyBtn.TextSize = 20
getKeyBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
getKeyBtn.TextColor3 = Color3.fromRGB(255,255,255)
getKeyBtn.BorderSizePixel = 0
local getKeyCorner = Instance.new("UICorner", getKeyBtn)
getKeyCorner.CornerRadius = UDim.new(0,8)

-- Funções dos botões
accessBtn.MouseButton1Click:Connect(function()
    if isValidKey(keyBox.Text) then
        result.Text = "Acesso Liberado!"
        result.TextColor3 = Color3.fromRGB(0, 180, 0)
        -- Coloque aqui o script que será liberado!
    else
        result.Text = "Key Incorreta!"
        result.TextColor3 = Color3.fromRGB(180, 0, 0)
    end
end)

getKeyBtn.MouseButton1Click:Connect(function()
    if syn and syn.open then
        syn.open(LINK_SITE_KEY)
    elseif KRNL_LOADED then
        setclipboard(LINK_SITE_KEY)
    else
        setclipboard(LINK_SITE_KEY)
    end
    result.Text = "Link copiado ou navegador aberto!"
    result.TextColor3 = Color3.fromRGB(0, 0, 180)
end)
