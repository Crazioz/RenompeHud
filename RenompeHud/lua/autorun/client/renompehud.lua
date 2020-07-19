if SERVER then 	
	resource.AddFile( "materials/icones16/bulletproof.png" )
	resource.AddFile( "materials/icones16/cardiogram.png" )
	resource.AddFile( "materials/icones16/fast-food.png" )
	resource.AddFile( "materials/icones16/gun.png" )
	resource.AddFile( "materials/icones16/gun11.png" )
	resource.AddFile( "materials/icones16/handcuffs.png" )
	resource.AddFile( "materials/icones16/locked.png" )
	resource.AddFile( "materials/icones16/money.png" )
	resource.AddFile( "materials/icones16/money-bag.png" )
	resource.AddFile( "materials/icones16/editor-3s-45px.gif" )
	return 
end

local function RespX(x) return x/1366*ScrH() end
local function RespY(y) return y/768*ScrH() end

hook.Add("HUDPaint", "Hud", function()

	--[[ variables ]]--
	
	local health = math.Clamp(LocalPlayer():Health(), 0, 100)
	local armor = math.Clamp(LocalPlayer():Armor(), 0, 100)
	local name = LocalPlayer():Name()
	local faim = LocalPlayer():getDarkRPVar("Energy")
	local salaire = LocalPlayer():getDarkRPVar("salary")
	local money = LocalPlayer():getDarkRPVar("money")
	local job = LocalPlayer():getDarkRPVar("job")
	
	--Icons pour l'hud
	local Page = Material( "materials/icones16/gun.png" )
	local iconarmure = Material( "materials/icones16/bulletproof.png" )
	local iconvie = Material( "materials/icones16/cardiogram.png" )
	local iconfaim = Material( "materials/icones16/fast-food.png" )
	local argent = Material( "materials/icones16/money-bag.png")
	local Rechercher = Material("materials/icones16/shield.png")
	local Arrêter = Material("materials/icones16/handcuffs.png")
	local salary = Material("materials/icones16/money.png")
	local jobicon = Material("materials/icones16/briefcase.png")
	local profilicon = Material("materials/icones16/user.png")
	
	--[[ backgrounds ]]--
	
	surface.SetDrawColor(46, 49, 49, 200)
	surface.DrawRect(RespX(500), RespY(640), RespX(445), RespY(115))	-- box info
	surface.DrawRect(RespX(15), RespY(610), RespX(465), RespY(32.5))	-- box bienvenue
	surface.DrawRect(RespX(965), RespY(640), RespX(90), RespY(115))	 -- Info Wanted ect..
	
	-- vous pouver modifier les textes entre les [""] 
	-- /!\ ne pas toucher  police-2 /!\
	
	surface.SetDrawColor(255, 255, 255)
	draw.DrawText("Bienvenue sur [Nom du serveur]", "police-2", ScrW() * 0.1000, ScrH() * 0.8025, Color(255,255,255,255), TEXT_ALIGN_CENTER)
	draw.DrawText("Nom: "..name, "police-2", ScrW() * 0.30, ScrH() * 0.840, Color(255, 255, 255), TEXT_ALIGN_CENTER )
	draw.DrawText("Métier: "..job, "police-2", ScrW() * 0.30, ScrH() * 0.8775, Color(255, 255, 255), TEXT_ALIGN_CENTER )
	draw.DrawText("Salaire: "..salaire.. " €", "police-2", ScrW() * 0.30, ScrH() * 0.9150, Color(255,255,255), TEXT_ALIGN_CENTER )
	draw.DrawText("Porte-monnaie: "..money.." €", "police-2",  ScrW() * 0.305, ScrH() * 0.9510, Color(255, 255, 255), TEXT_ALIGN_CENTER )
	
	--[Box barre vie]--
	
	surface.SetDrawColor(46, 49, 49, 200)
	surface.DrawRect(RespX(80), RespY(654.5), RespX(400), RespY(25)) 			-- box barre vie
	surface.DrawRect(RespX(15), RespY(652.5), RespX(55), RespY(30))  			--box icones
	surface.SetDrawColor(217,30,24,200)											--couleur barre vie
	surface.DrawRect(RespX(90), RespY(658.5), RespX(health* 3.8), RespY(15))  	--box couleur vie
	surface.SetDrawColor( 255, 255, 255, 255 )									--couleur icons
	surface.SetMaterial( iconvie )												--IconVIE
	surface.DrawTexturedRect(RespX(20), RespY(655.5), RespX(45), RespY(25))		--POS IconVIE
	
	--[Box barre Armure]--
	
	surface.SetDrawColor(46,49,49,200)
	surface.DrawRect(RespX(80), RespY(692), RespX(400), RespY(25))				-- box barre armure
	surface.DrawRect(RespX(15), RespY(688), RespX(55), RespY(30))  				--box icones
	surface.SetDrawColor(0, 153, 153, 255)										--couleur barre armure
	surface.DrawRect(RespX(90), RespY(695.5), RespX(armor* 3.8), RespY(15))  	--box couleur armure
	surface.SetDrawColor( 255, 255, 255, 255 )									--couleur icons
	surface.SetMaterial( iconarmure )											--IconARMURE
	surface.DrawTexturedRect(RespX(20), RespY(690.5), RespX(45), RespY(25))		--POS IconARMURE
	
	--[Box barre Faim]--
	
	surface.SetDrawColor(46,49,49,200)
	surface.DrawRect(RespX(80), RespY(727), RespX(400), RespY(25))				-- box barre faim
	surface.DrawRect(RespX(15), RespY(725), RespX(55), RespY(30)) 				--box icones
	surface.SetDrawColor(184, 121, 0, 255)										--couleur barre faim
	surface.DrawRect(RespX(90), RespY(732.5), RespX(faim * 3.8), RespY(15))  	--box couleur faim
	surface.SetDrawColor( 255, 255, 255, 255 )									--couleur icons
	surface.SetMaterial( iconfaim )												--IconFAIM
	surface.DrawTexturedRect(RespX(20), RespY(727.5), RespX(45), RespY(25))		--POS IconFAIM
	
	
	--[Box License/Wante/arrested]--
	
	surface.SetDrawColor(49, 49, 49, 200)
	surface.SetMaterial(Page)
    if LocalPlayer():getDarkRPVar("HasGunlicense") then
        surface.SetDrawColor(255, 255, 255, 255)
    end
    surface.DrawTexturedRect(RespX(985), RespY(650), RespX(45), RespY(25))
	
	surface.SetMaterial(Rechercher)
    surface.SetDrawColor(49, 49, 49, 200)
    if LocalPlayer():getDarkRPVar("wanted") then
        surface.SetDrawColor(255, 255, 255, 255)
    end
    surface.DrawTexturedRect(RespX(985), RespY(687.5), RespX(45), RespY(25))
	
	surface.SetMaterial(Arrêter)
    surface.SetDrawColor(49, 49, 49, 200)
    if LocalPlayer():getDarkRPVar("Arrested") then
        surface.SetDrawColor(255, 255, 255, 255)
    end
    surface.DrawTexturedRect(RespX(985), RespY(725), RespX(45), RespY(25))
	
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.SetMaterial( argent )
    surface.DrawTexturedRect(RespX(510), RespY(727.5), RespX(42.5), RespY(22.5))

	surface.SetMaterial( salary )
    surface.DrawTexturedRect(RespX(510), RespY(700), RespX(45), RespY(25))
	
	surface.SetMaterial( jobicon )
    surface.DrawTexturedRect(RespX(510), RespY(670), RespX(45), RespY(25))

	surface.SetMaterial( profilicon )
    surface.DrawTexturedRect(RespX(510), RespY(642.5), RespX(45), RespY(25))
end)

surface.CreateFont( "police-1", { 		-- Ne pas suprimmer /!\ 
	font = "Roboto", --Police d'écriture 
	extended = false,
	size = 20,
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})
	
surface.CreateFont( "police-2", { 		-- Ne pas suprimmer /!\ 
	font = "Roboto", --Police d'écriture 
	extended = false,
	size = 18,
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})
	
-------------------------------------------------------------------------------
-- Suprime les HUD de base : Ne pas Suprimé /!\                               --
-------------------------------------------------------------------------------

local HideElementsTable = {
	["DarkRP_HUD"]              = true,
    ["DarkRP_LocalPlayerHUD"]   = true,
    ["DarkRP_EntityDisplay"]    = true,
    ["DarkRP_ZombieInfo"]       = true,
    ["DarkRP_Hungermod"]        = true,
    ["DarkRP_Agenda"]           = true,
    ["CHudHealth"]              = true,
    ["CHudBattery"]             = true,
    ["CHudSuitPower"]           = true,
    ["CHudAmmo"]                = true,
    ["CHudSecondaryAmmo"]       = true,
}

local function HideElements( element )
	if HideElementsTable[ element ] then
		
		return false

	end
end
hook.Add( "HUDShouldDraw", "HideElements", HideElements )

--Notification darkrp

local function DisplayNotify(msg) local txt = msg:ReadString() GAMEMODE:AddNotify(txt, msg:ReadShort(), msg:ReadLong()) surface.PlaySound("buttons/lightswitch2.wav")
end
usermessage.Hook("_Notify", DisplayNotify) 

-- Message de démarrage de l'addon

print("\n")
MsgC(Color(0,255,0), "---->\n")
print("\n")
MsgC(Color(255, 0, 0), " > ") MsgC(Color(255,255,255), "RenompeHud Charger avec sucées ! ...\n")
MsgC(Color(255, 0, 0), " > ") MsgC(Color(255,255,255), "Version: 1.0\n")
print("\n")
MsgC(Color(255, 0, 0), " > ") MsgC(Color(255,255,255), "Mon steam: https://steamcommunity.com/id/craziozcodage\n")
MsgC(Color(255, 0, 0), " > ") MsgC(Color(255,255,255), "Mon discord Crazioz#7740\n")
print("\n")
MsgC(Color(0,255,0), "---->\n")
print("\n")