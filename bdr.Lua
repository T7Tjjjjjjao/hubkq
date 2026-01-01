-- T 7 T Hub | Professional Reality Bypass
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local homeLocation = nil
local isMoving = false

-- إشعار احترافي
local function ShowSuccess()
    local msg = Instance.new("Message", workspace)
    msg.Text = "تم حفظ إحداثيات منزلك بنجاح ✅"
    task.wait(1.5)
    msg:Destroy()
end

-- ميزة الأرضية الشبحية الواسعة والمتحركة
local function EliteStealthMove(targetCF)
    if isMoving then return end
    isMoving = true
    
    -- أرضية أوسع لضمان الثبات (كما طلبت)
    local ghostFloor = Instance.new("Part")
    ghostFloor.Size = Vector3.new(20, 1, 20)
    ghostFloor.Transparency = 1
    ghostFloor.Anchored = true
    ghostFloor.CanCollide = true
    ghostFloor.Parent = workspace
    
    hum.PlatformStand = true -- وضعية الانسداح المطلوبة
    
    local startPos = hrp.Position
    local endPos = targetCF.Position + Vector3.new(0, 6, 0)
    local duration = (endPos - startPos).Magnitude / 19 -- سرعة آمنة جداً
    
    local startTime = tick()
    
    local moveLoop
    moveLoop = RunService.Heartbeat:Connect(function()
        local elapsed = tick() - startTime
        local t = elapsed / duration
        
        -- Easing Function: تجعل الحركة تبدو طبيعية (تبدأ ببطء وتنتهي ببطء)
        local alpha = t * t * (3 - 2 * t) 
        
        if t >= 1 then
            moveLoop:Disconnect()
            ghostFloor:Destroy()
            hum.PlatformStand = false
            isMoving = false
            return
        end
        
        local currentPos = startPos:Lerp(endPos, alpha)
        hrp.CFrame = CFrame.new(currentPos) * CFrame.Angles(math.rad(-90), 0, 0)
        ghostFloor.CFrame = CFrame.new(currentPos - Vector3.new(0, 3.8, 0))
    end)
end

-- واجهة T 7 T Hub (سماوية نخبوية)
-- [هنا تضع نفس كود الواجهة السابق مع ربط الأزرار]
-- زر الحفظ -> ShowSuccess() ثم homeLocation = hrp.CFrame
-- زر الانتقال -> EliteStealthMove(homeLocation)
