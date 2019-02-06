net.Receive("F4Menu", function()
local MainFrame = vgui.Create( "DFrame" )

local title = ""
local srvname = nil
if ( GetHostName() == "Garry's Mod" ) then
	srvname = "LocalHost"
	title = "Attention! Run on the server for full functionality." 
	else srvname = GetHostName()
end

MainFrame:SetPos( ScrW() * 520/1920, ScrH() * 100/1080 )
MainFrame:SetSize( ScrW() * 900/1920, ScrH() * 750/1080 )
MainFrame:SetTitle( title )
MainFrame:SetDraggable( false )
MainFrame:MakePopup()
MainFrame:ShowCloseButton( false )
MainFrame.Paint = function(self,w,h)

	draw.RoundedBox(0,0,100,900,24,Color(40, 40, 40,250))
	draw.RoundedBox(0,0,124,900,700,Color(30, 30, 30,255))
	draw.RoundedBox(0,100,55,4,40,Color(255, 255, 255,255))
	draw.RoundedBox(0,0,123,900,1.5,Color(229, 156, 9,255))

	draw.RoundedBox(0,5,130,220,100,Color(40, 40, 40,255))

	draw.RoundedBox(0,5,235,220,60,Color(40, 40, 40,255))
	draw.RoundedBox(0,5,300,220,60,Color(40, 40, 40,255))
	draw.RoundedBox(0,5,365,220,60,Color(40, 40, 40,255))
	
end

local HL2RPlabel = vgui.Create( "DLabel", MainFrame )
HL2RPlabel:SetPos( 4, 60 )
HL2RPlabel:SetFont("ScoreboardDefaultTitle")
HL2RPlabel:SetTextColor( Color( 240, 240, 240 ) )
HL2RPlabel:SetText( "HL2RP  " .. srvname )
HL2RPlabel:SizeToContents()
 
local CloseButton = vgui.Create( "DButton", MainFrame ) 
CloseButton:SetText( "⚫" )					
CloseButton:SetPos( 860, 97 )	
CloseButton:SetFont("ScoreboardDefaultTitle")				
CloseButton:SetSize( 50, 20 )	
CloseButton:SetColor( Color( 255 , 1, 1 ) )
CloseButton.DoClick = function()				
	MainFrame:Close()
 end
  function CloseButton:Paint()
    surface.SetDrawColor( 0, 0, 0, 0 );
    end

local FunctFrame = vgui.Create( "DFrame", MainFrame )

FunctFrame:SetPos( 235, 5 )
FunctFrame:SetSize( ScrW() * 660/1920, ScrH() * 740/1080 )
FunctFrame:SetTitle( "" )
FunctFrame:SetDraggable( false )
FunctFrame:ShowCloseButton( false )
FunctFrame.Paint = function(self,w,h)

	draw.RoundedBox(0,0,124,900,700,Color(40, 40, 40,255))
end
end)