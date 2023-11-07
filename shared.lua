--[[
Alot of people will be wondering what the fuck is this . Its the result of laziness.

I used chat gpt to generate every single thing in that table as i was too lazy to add a car dealer into my server that required me to manually add each one in-game using a shitty ui.

This is why im racist
]]
ENT.Base = "base_ai" 
ENT.Type = "ai"
ENT.PrintName = "cardea NPC"
ENT.Author = "tbx"
ENT.Spawnable = true
ENT.Category = "kinfo"
ENT.AdminSpawnable = true



// Available Cars

local mainSpawnPos = Vector(5981.371582, -4193.819824, 1827.968506) 
local mainSpawnAng = Angle(0,270,0)

--[[
NOT USED
viewmodelpos = Vector(-4502.060059, -4193.819824, 1551.031250)
viewmodelang = Angle(3.894012, -40.865463, 0.000000)
]]


CarDealerData = {

// Coupes

    {Entity = "simfphys_gta_sa_blistac", DisplayName = "Blista Compact", Price = 21500, model = "models/gta_sa/coupes_hatchbacks/blistac.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_bravura", DisplayName = "Bravura", Price = 31250, model = "models/gta_sa/coupes_hatchbacks/bravura.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_buccanee", DisplayName = "Buccaneer", Price = 29500, model = "models/gta_sa/coupes_hatchbacks/buccanee.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_cadrona", DisplayName = "Cadrona", Price = 23800, model = "models/gta_sa/coupes_hatchbacks/cadrona.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_clover", DisplayName = "Clover", Price = 46875, model = "models/gta_sa/coupes_hatchbacks/clover.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_club", DisplayName = "Club", Price = 25700, model = "models/gta_sa/coupes_hatchbacks/club.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_esperant", DisplayName = "Esperant", Price = 30800, model = "models/gta_sa/coupes_hatchbacks/esperant.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_feltzer", DisplayName = "Feltzer", Price = 22450, model = "models/gta_sa/coupes_hatchbacks/feltzer.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_fortune", DisplayName = "Fortune", Price = 32100, model = "models/gta_sa/coupes_hatchbacks/fortune.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_hermes", DisplayName = "Hermes", Price = 35300, model = "models/gta_sa/coupes_hatchbacks/hermes.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_hustler", DisplayName = "Hustler", Price = 28900, model = "models/gta_sa/coupes_hatchbacks/hustler.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_majestic", DisplayName = "Majestic", Price = 44900, model = "models/gta_sa/coupes_hatchbacks/majestic.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_manana", DisplayName = "Manana", Price = 25600, model = "models/gta_sa/coupes_hatchbacks/manana.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_previon", DisplayName = "Previon", Price = 30750, model = "models/gta_sa/coupes_hatchbacks/previon.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_sabre", DisplayName = "Sabre", Price = 22875, model = "models/gta_sa/coupes_hatchbacks/sabre.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_stallion", DisplayName = "Stallion", Price = 35900, model = "models/gta_sa/coupes_hatchbacks/stallion.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_tampa", DisplayName = "Tampa", Price = 25950, model = "models/gta_sa/coupes_hatchbacks/tampa.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_virgo", DisplayName = "Virgo", Price = 45100, model = "models/gta_sa/coupes_hatchbacks/virgo.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},

// Lowriders

    {Entity = "simfphys_gta_sa_blade", DisplayName = "Blade", Price = 68000, model = "models/gta_sa/lowriders/blade.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_broadway", DisplayName = "Broadway", Price = 71000, model = "models/gta_sa/lowriders/broadway.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_remingtn", DisplayName = "Remington", Price = 60000, model = "models/gta_sa/lowriders/remingtn.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_savanna", DisplayName = "Savanna", Price = 72000, model = "models/gta_sa/lowriders/savanna.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_slamvan", DisplayName = "Slamvan", Price = 69000, model = "models/gta_sa/lowriders/slamvan.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_tahoma", DisplayName = "Tahoma", Price = 55000, model = "models/gta_sa/lowriders/tahoma.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_tornado", DisplayName = "Tornado", Price = 65000, model = "models/gta_sa/lowriders/tornado.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_voodoo", DisplayName = "Voodoo", Price = 75000, model = "models/gta_sa/lowriders/voodoo.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},

// SUV / PICKSUPS

    {Entity = "simfphys_gta_sa_bobcat", DisplayName = "Bobcat", Price = 26500, model = "models/gta_sa/suvs_pickups/bobcat.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_huntley", DisplayName = "Huntley", Price = 30000, model = "models/gta_sa/suvs_pickups/huntley.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_landstalker", DisplayName = "Landstalker", Price = 29000, model = "models/gta_sa/suvs_pickups/landstal.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_mesa", DisplayName = "Mesa", Price = 27500, model = "models/gta_sa/suvs_pickups/mesa.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_picador", DisplayName = "Picador", Price = 28000, model = "models/gta_sa/suvs_pickups/picador.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_rancher", DisplayName = "Rancher", Price = 29500, model = "models/gta_sa/suvs_pickups/rancher.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_sadler", DisplayName = "Sadler", Price = 26000, model = "models/gta_sa/suvs_pickups/sadler.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_yosemite", DisplayName = "Yosemite", Price = 30000, model = "models/gta_sa/suvs_pickups/yosemite.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},

// SEDANS

    {Entity = "simfphys_gta_sa_admiral", DisplayName = "Admiral", Price = 45000, model = "models/gta_sa/sedans/admiral.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_elegant", DisplayName = "Elegant", Price = 52000, model = "models/gta_sa/sedans/elegant.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_emperor", DisplayName = "Emperor", Price = 39000, model = "models/gta_sa/sedans/emperor.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_glendale", DisplayName = "Glendale", Price = 56000, model = "models/gta_sa/sedans/glendale.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_greenwoo", DisplayName = "Greenwood", Price = 48000, model = "models/gta_sa/sedans/greenwoo.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_intruder", DisplayName = "Intruder", Price = 63000, model = "models/gta_sa/sedans/intruder.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_merit", DisplayName = "Merit", Price = 42000, model = "models/gta_sa/sedans/merit.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_nebula", DisplayName = "Nebula", Price = 53000, model = "models/gta_sa/sedans/nebula.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_oceanic", DisplayName = "Oceanic", Price = 45000, model = "models/gta_sa/sedans/oceanic.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_peren", DisplayName = "Perennial", Price = 52000, model = "models/gta_sa/sedans/peren.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_premier", DisplayName = "Premier", Price = 40000, model = "models/gta_sa/sedans/premier.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_primo", DisplayName = "Primo", Price = 48000, model = "models/gta_sa/sedans/primo.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_regina", DisplayName = "Regina", Price = 55000, model = "models/gta_sa/sedans/regina.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_romero", DisplayName = "Romero", Price = 42000, model = "models/gta_sa/sedans/romero.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_sentinel", DisplayName = "Sentinel", Price = 61000, model = "models/gta_sa/sedans/sentinel.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_solair", DisplayName = "Solair", Price = 46000, model = "models/gta_sa/sedans/solair.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_stafford", DisplayName = "Stafford", Price = 59000, model = "models/gta_sa/sedans/stafford.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_stretch", DisplayName = "Stretch", Price = 64000, model = "models/gta_sa/sedans/stretch.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_sunrise", DisplayName = "Sunrise", Price = 50000, model = "models/gta_sa/sedans/sunrise.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},



// VANS

    {Entity = "simfphys_gta_sa_burrito", DisplayName = "Burrito", Price = 32000, model = "models/gta_sa/vans/burrito.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_moonbeam", DisplayName = "Moonbeam", Price = 29000, model = "models/gta_sa/vans/moonbeam.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_pony", DisplayName = "Pony", Price = 26000, model = "models/gta_sa/vans/pony.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_rumpo", DisplayName = "Rumpo", Price = 30000, model = "models/gta_sa/vans/rumpo.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},


// TUNERS

    {Entity = "simfphys_gta_sa_elegy", DisplayName = "Elegy", Price = 220000, model = "models/gta_sa/tuners/elegy.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_flash", DisplayName = "Flash", Price = 250000, model = "models/gta_sa/tuners/flash.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_jester", DisplayName = "Jester", Price = 270000, model = "models/gta_sa/tuners/jester.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_stratum", DisplayName = "Stratum", Price = 230000, model = "models/gta_sa/tuners/stratum.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_sultan", DisplayName = "Sultan", Price = 260000, model = "models/gta_sa/tuners/sultan.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_uranus", DisplayName = "Uranus", Price = 240000, model = "models/gta_sa/tuners/uranus.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},


// SPORTS

    {Entity = "simfphys_gta_sa_alpha", DisplayName = "Alpha", Price = 300000, model = "models/gta_sa/sport cars/alpha.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_banshee", DisplayName = "Banshee", Price = 400000, model = "models/gta_sa/sport cars/banshee.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_buffalo", DisplayName = "Buffalo", Price = 350000, model = "models/gta_sa/sport cars/buffalo.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_bullet", DisplayName = "Bullet", Price = 450000, model = "models/gta_sa/sport cars/bullet.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_cheetah", DisplayName = "Cheetah", Price = 500000, model = "models/gta_sa/sport cars/cheetah.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_comet", DisplayName = "Comet", Price = 350000, model = "models/gta_sa/sport cars/comet.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_euros", DisplayName = "Euros", Price = 275000, model = "models/gta_sa/sport cars/euros.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_hotknife", DisplayName = "Hotknife", Price = 275000, model = "models/gta_sa/sport cars/hotknife.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_infernus", DisplayName = "Infernus", Price = 450000, model = "models/gta_sa/sport cars/infernus.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_phoenix", DisplayName = "Phoenix", Price = 325000, model = "models/gta_sa/sport cars/phoenix.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_supergt", DisplayName = "Super GT", Price = 375000, model = "models/gta_sa/sport cars/supergt.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_turismo", DisplayName = "Turismo", Price = 300000, model = "models/gta_sa/sport cars/turismo.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_windsor", DisplayName = "Windsor", Price = 290000, model = "models/gta_sa/sport cars/windsor.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},
    {Entity = "simfphys_gta_sa_zr350", DisplayName = "ZR-350", Price = 325000, model = "models/gta_sa/sport cars/zr350.mdl", SpawnPos = mainSpawnPos, SpawnAng = mainSpawnAng},


}



