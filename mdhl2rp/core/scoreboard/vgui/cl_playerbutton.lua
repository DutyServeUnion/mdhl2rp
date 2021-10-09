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
     