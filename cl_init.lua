include("shared.lua")
local function PaintMainFrame(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(10, 10, 10, 250))
    draw.RoundedBox(0, 0, 0, w, 1, Color(255, 0, 0, 225))
    draw.RoundedBox(0, 0, h - 1, w, 1, Color(255, 0, 0, 225))
    draw.RoundedBox(0, 0, 0, 1, h, Color(255, 0, 0, 225))
    draw.RoundedBox(0, w - 1, 0, 1, h, Color(255, 0, 0, 225))
end

local function PaintViewerFrame(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(10, 10, 10, 250))
    draw.RoundedBox(0, 0, 0, w, 1, Color(255, 0, 0, 225))
    draw.RoundedBox(0, 0, h - 1, w, 1, Color(255, 0, 0, 225))
    --draw.RoundedBox(0, 0, 0, 1, h, Color(255, 0, 0, 225))
    draw.RoundedBox(0, w - 1, 0, 1, h, Color(255, 0, 0, 225))
end

local function ShowCarDealerMenu()
    local frame = vgui.Create("DFrame")
    frame:SetSize(400, 330)
    frame:SetTitle("CAR DEALER")
    frame:SetPos(ScrW() / 2 - 400, ScrH()) -- Start off-screen at the bottom
    frame:MoveTo(ScrW() / 2 - 400, ScrH() / 3, 0.5, 0, 0.5)
    frame:MakePopup()
    frame:SetDraggable(false)
    frame.Paint = PaintMainFrame
    local openGarageButton = vgui.Create("DButton", frame)
    openGarageButton:SetPos(10, 30)
    openGarageButton:SetSize(380, 30)
    openGarageButton:SetText("Open Garage")
    openGarageButton:SetEnabled(false) -- Initially disabled
    openGarageButton.DoClick = function()
        RunConsoleCommand("opengarage")
        frame:Close()
    end

    local vehicleList = vgui.Create("DListView", frame)
    vehicleList:SetPos(10, 70)
    vehicleList:SetSize(380, 210)
    vehicleList:SetMultiSelect(false)
    vehicleList:AddColumn("Vehicle")
    vehicleList:AddColumn("Price")
    local priceTable = {}
    for key, data in pairs(CarDealerData) do
        local price = tonumber(data.Price) -- Convert to a number
        if price then
            table.insert(
                priceTable,
                {
                    Key = key,
                    Price = price,
                    Display = data.DisplayName
                }
            )
        end
    end

    table.sort(priceTable, function(a, b) return a.Price < b.Price end)
    vehicleList:Clear()


    for _, entry in ipairs(priceTable) do
        local formattedPrice = DarkRP and DarkRP.formatMoney(entry.Price) or entry.Price
        vehicleList:AddLine(entry.Display, formattedPrice)
    end

    -- for key, data in pairs(CarDealerData) do
    --     local formattedPrice = DarkRP and DarkRP.formatMoney(data.Price) or data.Price
    --     vehicleList:AddLine(data.DisplayName, formattedPrice)
    -- end

    local purchaseButton = vgui.Create("DButton", frame)
    purchaseButton:SetPos(10, 290)
    purchaseButton:SetSize(380, 30)
    purchaseButton:SetText("Purchase Selected Vehicle")
    purchaseButton.DoClick = function()
        local selectedLine = vehicleList:GetSelectedLine()
        if not selectedLine then
            return
        end

        local selectedData = CarDealerData[selectedLine]
        if not selectedData then
            return
        end

        net.Start("PurchaseCar")
        net.WriteUInt(selectedLine, 16)
        net.SendToServer()
        frame:Close()
    end

    timer.Simple(
        1,
        function()
            if IsValid(frame) then
                local viewerframe = vgui.Create("DFrame")
                viewerframe:SetSize(400, 330)
                viewerframe:ShowCloseButton(false)
                viewerframe:SetTitle("SELECTED VEHICLE VIEWER")
                viewerframe:SetDraggable(false)

                local frameX, frameY = frame:GetPos()
                local frameWidth = frame:GetSize()
                local viewerX = frameX + frameWidth
                viewerframe:SetPos(viewerX, frameY)
                viewerframe:MakePopup()
                viewerframe.Paint = PaintViewerFrame
                local modelPanel = vgui.Create("DModelPanel", viewerframe)
                modelPanel:SetSize(380, 330)
                local modelPanelX = (viewerframe:GetWide() - modelPanel:GetWide()) / 2
                local modelPanelY = (viewerframe:GetTall() - modelPanel:GetTall()) / 2
                modelPanel:SetPos(modelPanelX, modelPanelY)
                modelPanel:SetCamPos(Vector(100, -100, 20))
                modelPanel:SetFOV(100)
                if CarDealerData[1] and CarDealerData[1].model then modelPanel:SetModel(CarDealerData[1].model) end
                vehicleList.OnRowSelected = function(_, index, row)
                    local selectedData = CarDealerData[index]
                    if selectedData and selectedData.model then modelPanel:SetModel(selectedData.model) end
                end

                frame.OnClose = function() viewerframe:Close() end
                openGarageButton:SetEnabled(true)
            end
        end
    )
end

net.Receive("ShowCarDealerMenu", ShowCarDealerMenu)
--   function viewerframe:Paint(w, h)
--[[ This is quite laggy, but its cool. I will leave it hear but opt- out from using it]]
--     local old = DisableClipping(true)
--     render.RenderView({
--         origin = Vector(-5193.003418, -2492.480469, 1551.031250),
--         angles = Angle(1.847991, 137.376007, 0),
--         x = viewerX,  -- Always set x to 0
--         y = frameY,  -- Always set y to 0
--         w = w,
--         h = h
--     })
--     DisableClipping(old)
-- end
local carDataMap = {}
for _, carData in pairs(CarDealerData) do
    carDataMap[carData.Entity] = carData.DisplayName
end

local function OpenGarageMenu()
    local frame = vgui.Create("DFrame")
    frame:SetSize(400, 300)
    frame:SetTitle("Garage")
    frame:Center()
    frame:MakePopup()
    frame.Paint = PaintMainFrame
    local list = vgui.Create("DListView", frame)
    list:Dock(FILL)
    list:SetMultiSelect(false)
    list:AddColumn("Car Name")
    net.Start("RequestOwnedCars")
    net.SendToServer()
    local displayNameMap = {}
    net.Receive(
        "ReceiveOwnedCars",
        function()
            local ownedCars = net.ReadTable()
            for _, car in pairs(ownedCars) do
                local displayName = carDataMap[car] or car
                displayNameMap[displayName] = car
                list:AddLine(displayName)
            end

            -- Add a Refund button
            local refundButton = vgui.Create("DButton", frame)
            refundButton:Dock(BOTTOM)
            refundButton:SetText("Refund Selected Car")
            refundButton.DoClick = function()
                local selectedLine = list:GetSelectedLine()
                if not selectedLine then return end
                local selectedDisplayName = list:GetLine(selectedLine):GetValue(1)
                local selectedEntityName = displayNameMap[selectedDisplayName]
                net.Start("RequestRefundCar")
                net.WriteString(selectedEntityName)
                net.SendToServer()
            end

            local returnButton = vgui.Create("DButton", frame)
            returnButton:Dock(BOTTOM)
            returnButton:SetText("Return Vehicle")
            returnButton.DoClick = function()
                net.Start("RequestReturnCar")
                net.SendToServer()
            end

            local spawnButton = vgui.Create("DButton", frame)
            spawnButton:Dock(BOTTOM)
            spawnButton:SetText("Spawn Selected Car")
            spawnButton.DoClick = function()
                local selectedLine = list:GetSelectedLine()
                if not selectedLine then return end
                local selectedDisplayName = list:GetLine(selectedLine):GetValue(1)
                local selectedEntityName = displayNameMap[selectedDisplayName]
                net.Start("SpawnSelectedCar")
                net.WriteString(selectedEntityName)
                net.SendToServer()
            end
        end
    )
end

concommand.Add("opengarage", OpenGarageMenu)
hook.Add(
    "PostDrawOpaqueRenderables",
    "kinfo_cardealer",
    function()
        for _, ent in pairs(ents.FindByClass("kinfo_cardealer")) do
            if ent:GetPos():Distance(LocalPlayer():GetPos()) < 200 then
                local pos = ent:GetPos() + Vector(0, 0, 1) * math.sin(CurTime() * 2) * 2
                local PlayersAngle = LocalPlayer():GetAngles()
                local ang = Angle(0, PlayersAngle.y - 180, 0)
                ang:RotateAroundAxis(ang:Right(), -90)
                ang:RotateAroundAxis(ang:Up(), 90)
                cam.Start3D2D(pos, ang, 0.2)
                draw.SimpleTextOutlined("Vehicles", "kinfo22", 0, -420, Color(0, 255, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 255))
                cam.End3D2D()
            end
        end
    end
)
