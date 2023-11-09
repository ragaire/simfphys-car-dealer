AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")



util.AddNetworkString("ShowCarDealerMenu")
util.AddNetworkString("PurchaseCar")
util.AddNetworkString("ShowOwnedCars")
util.AddNetworkString("RequestOwnedCars")
util.AddNetworkString("ReceiveOwnedCars")
util.AddNetworkString("SpawnSelectedCar")
util.AddNetworkString("RequestRefundCar")
util.AddNetworkString("RequestReturnCar")

local function GetOwnedCars(playerID)
    local query = "SELECT car_list FROM kinfo_cardealer WHERE player_id = '" .. playerID .. "'"
    local result = sql.QueryValue(query)
    if result then
        return string.Explode(",", result)
    else
        return {}
    end
end

net.Receive(
    "RequestOwnedCars",
    function(len, ply)
        local playerID = ply:SteamID()
        local ownedCars = GetOwnedCars(playerID)
        net.Start("ReceiveOwnedCars")
        net.WriteTable(ownedCars)
        net.Send(ply)
    end
)

local spawnedVehicles = {}
net.Receive(
    "RequestReturnCar",
    function(len, ply)
        local playerID = ply:SteamID()
        if spawnedVehicles[playerID] and IsValid(spawnedVehicles[playerID]) then
            spawnedVehicles[playerID]:Remove()
            spawnedVehicles[playerID] = nil
            ply:ChatPrint("You have returned your vehicle.")
        else
            -- The player doesn't have a spawned vehicle
            ply:ChatPrint("You don't have a spawned vehicle to return.")
        end
    end
)

net.Receive(
    "SpawnSelectedCar",
    function(len, ply)
        local selectedCar = net.ReadString()
        local playerID = ply:SteamID()
        local ownedCars = GetOwnedCars(playerID)
        if table.HasValue(ownedCars, selectedCar) then
            if spawnedVehicles[playerID] and IsValid(spawnedVehicles[playerID]) then
                ply:ChatPrint("You already have a spawned vehicle. You cannot spawn another one.")
                return
            end

            local selectedData = nil
            for _, carData in pairs(CarDealerData) do
                if carData.Entity == selectedCar then
                    selectedData = carData
                    break
                end
            end

            if selectedData then
                local pos = selectedData.SpawnPos
                local ang = selectedData.SpawnAng
                local vehicle = selectedCar
                local spawnedVehicle = simfphys.SpawnVehicleSimple(vehicle, pos, ang)
                spawnedVehicle:CPPISetOwner(ply)
                if spawnedVehicle:isKeysOwnable() then spawnedVehicle:keysOwn(ply) end
                spawnedVehicles[playerID] = spawnedVehicle
                ply:ChatPrint("You have spawned vehicle: " .. selectedData.DisplayName)
            else
                ply:ChatPrint("Selected car data not found in CarDealerData.")
            end
        else
            ply:ChatPrint("You do not own the selected car.")
        end
    end
)

hook.Add(
    "EntityRemoved",
    "CleanupSpawnedVehicles",
    function(ent)
        if ent:IsVehicle() then
            for playerID, vehicle in pairs(spawnedVehicles) do
                if vehicle == ent then
                    -- Remove da car from the spawnedVehicles table
                    spawnedVehicles[playerID] = nil
                    break
                end
            end
        end
    end
)

net.Receive(
    "PurchaseCar",
    function(len, ply)
        local selectedLine = net.ReadUInt(16)
        local selectedData = CarDealerData[selectedLine]
        if not selectedData then
            print("error: no selected data")
            return
        end

        local playerID = ply:SteamID()
        local carList = sql.QueryValue("SELECT car_list FROM kinfo_cardealer WHERE player_id = '" .. playerID .. "'")
        if carList and string.find(carList, selectedData.Entity) then
            ply:ChatPrint("You already own a " .. selectedData.DisplayName)
            return
        end

        if ply:canAfford(selectedData.Price) then
            ply:addMoney(-selectedData.Price)
            --local playerID = ply:SteamID()
            --local carList = sql.QueryValue("SELECT car_list FROM kinfo_cardealer WHERE player_id = '" .. playerID .. "'")
            if not carList then
                carList = selectedData.Entity
                sql.Query("INSERT INTO kinfo_cardealer (player_id, car_list) VALUES ('" .. playerID .. "', '" .. carList .. "')")
                print("Inserted row into kinfo_cardealer database for player " .. playerID)
            else
                carList = carList .. "," .. selectedData.Entity
                sql.Query("UPDATE kinfo_cardealer SET car_list = '" .. carList .. "' WHERE player_id = '" .. playerID .. "'")
            end

            ply:ChatPrint("You have bought a " .. selectedData.DisplayName .. " for " .. DarkRP.formatMoney(selectedData.Price))
        else
            ply:ChatPrint("You cannot afford a " .. selectedData.DisplayName)
        end
    end
)

net.Receive(
    "RequestRefundCar",
    function(len, ply)
        local selectedEntityName = net.ReadString()
        local playerID = ply:SteamID()
        local selectedData = nil
        for _, carData in pairs(CarDealerData) do
            if carData.Entity == selectedEntityName then
                selectedData = carData
                break
            end
        end

        if not selectedData then
            ply:ChatPrint("Refund failed. Car data not found.")
            return
        end

        local carList = sql.QueryValue("SELECT car_list FROM kinfo_cardealer WHERE player_id = '" .. playerID .. "'")
        if not carList or not string.find(carList, selectedEntityName) then
            ply:ChatPrint("Refund failed. You may not own the selected car.")
            return
        end

        local refundAmount = selectedData.Price * 0.75 -- refund amount multiplier
        carList = string.gsub(carList, selectedEntityName, "") -- Remove the car from the list
        carList = string.gsub(carList, ",,", ",") -- Remove any double commas
        carList = string.Trim(carList, ",") -- Trim any leading or trailing commas
        sql.Query("UPDATE kinfo_cardealer SET car_list = '" .. carList .. "' WHERE player_id = '" .. playerID .. "'")
        -- Refund the player
        ply:addMoney(refundAmount)
        ply:ChatPrint("You have received a refund of " .. DarkRP.formatMoney(refundAmount) .. " for your " .. selectedData.DisplayName)
    end
)

function ENT:Use(ply)
    net.Start("ShowCarDealerMenu")
    net.WriteTable(CarDealerData)
    net.Send(ply)
end

function ENT:Initialize()
    self:SetModel("models/player/Spediest/truth.mdl")
    self:SetHullType(HULL_HUMAN)
    self:SetHullSizeNormal()
    self:SetNPCState(NPC_STATE_SCRIPT)
    self:SetSolid(SOLID_BBOX)
    self:CapabilitiesAdd(CAP_ANIMATEDFACE)
    self:SetUseType(SIMPLE_USE)
    self:DropToFloor()
    local createTableQuery = [[
        CREATE TABLE IF NOT EXISTS kinfo_cardealer (
            player_id INT PRIMARY KEY,
            car_list TEXT
        )
    ]]
    local result = sql.Query(createTableQuery)
    if not result then print("kinfo_cardealer table already created! :D ") end

    -- uhhh ? better to double triple to the power of 10 check if its there right?
end
