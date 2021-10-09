local PANEL = {}

surface.CreateFont("pCrdName" , {
    font = "Roboto"
    weight = 2000
    antialias = true, 
    shadow = false, 
    extended = true,
    size = 30
})
 
surface.CreateFont("pCardMisc" , {
    font = "Arial"
    weight = 3000
    size = 18
    antialias = true,
    extended = true, 
    shadow = true, 
})

function PANEL:Paint(w,h)
    if not IsValid(self.Owner) then return end
    surface.SetMaterial(Material("vgui/gradient-1")

    local r, gC, b = self.Color:Unpack()
    
    surface.DrawRect(0, 0, w, h)
    
    surface.SetDrawColor(r,gC,b,255)

    surface.DrawTexturedRect(0, 0, w, h)
    surface.SetDrawColor(r/2,gC/2,b/2,150)

    if not self.Owner then return end

    draw.SimpleText( self.Owner:Ping(), "pCardMisc", w-5, 5, color_white TEXT_ALIGN_RIGHT)

    draw.SimpleText(self.Owner:Nick(), "pCardName", 69, 5)
end

function PANEL:SetPlayer(ply)
    if not ply:IsPlayer() then return end
    self.Owner = ply
    self.Color = team.GetColor( ply:Team())
    self.icon:SetModel(ply:GetModel())
    self.Icon:SetFOV(3.4)
	self.Icon:SetLookAt(Vector(0, -0, 66.1))
	self.Icon:SetCamPos(Vector(190,-50,71))
	self.Icon:SetAnimSpeed( 4 )
	self.Icon:SetDisabled( true )
    
    	for v,b in ipairs(obums.Badges.Data) do
		if b.userTest(ply) then
			table.ForceInsert(self.Badges, b)
		end
	end
	for i,k in ipairs(self.Badges) do
		local icon = k.icon
		local btn  = vgui.Create( "DButton", self)
		btn:SetSize(16,16)
		btn:SetPos(69+(i-1)*16,29)
		btn:SetText("")
		btn.Paint = function(self,w,h)
			surface.SetMaterial(Material(icon))
			surface.SetDrawColor(255, 255, 255)
			surface.DrawTexturedRect(0, 0, w, h)
		end
		btn.DoClick = function(self)
			Derma_Message(k.desc, "Badge Info")
		end
	end

end
function PANEL:Init()

	self:SetText("")
	self:SetTooltip("Click to open card")
	self.Icon = vgui.Create("DModelPanel", self)
	self.Icon:SetSize(62,62)
	self.Icon:SetPos(1,1)
	self.Owner = nil
	self.Badges ={}
	function self.Icon:LayoutEntity()
	end
end
function PANEL:DoClick()
	if not IsValid( self.Owner ) then return end
	if openPlayercard then return end
	openPlayercard = true
	local __ = vgui.Create("ObumPlayerCard")
	__:Center()
	__:MakePopup()
	__:SetPlayer( self.Owner )
end

vgui.Register("PlayerPanel", PANEL, "DButton")
    