local require = require
local tonumber = tonumber

_ENV = module(...)

local MGR = require'sys.mgr'
local CMD = require'sys.cmd'
local IO = require'sys.io'
local PROGRESS = require'sys.progress'
local STATUSBAR = require'sys.statusbar'
local CREATE = require'app.Edit.Create'
local Line = require'app.Graphics.Line'.Class
local Rect = require'app.Graphics.Rect'.Class
local Member = require'app.Steel.Member'.Class
local MemberArc = require'app.Steel.MemberArc'.Class
local Plate = require'app.Steel.Plate'.Class

local iup = require"iuplua"

local Path = 'cfg/Family/Structure/'
local Name = 'QM'
Readme = {title=Name,icon=Path..Name..'.bmp',tip='',remark=''}




local plane_label_ = iup.label{title="Array: "}
local ary_x_label_ = iup.label{title="x="}
local ary_x_text_ = iup.text{expand="HORIZONTAL",value=1}
local ary_y_label_ = iup.label{title="y="}
local ary_y_text_ = iup.text{expand="HORIZONTAL",value=1}
local floor_label_ = iup.label{title="Floor: "}
local ary_z_label_ = iup.label{title="z="}
local ary_z_text_ = iup.text{expand="HORIZONTAL",value=1}

local column_section_label_ = iup.label{title="Section:"}
local column_section_text_ = iup.text{expand="HORIZONTAL", value="S300*300*12"}

local girder_section_label_ = iup.label{title="Section:"}
local girder_section_text_ = iup.text{expand="HORIZONTAL", value="H400*200*6*12"}

local beam_section_label_ = iup.label{title="Section:"}
local beam_section_text_ = iup.text{expand="HORIZONTAL", value="H200*100*5*7"}

local vault_section_label_ = iup.label{title="Section:"}
local vault_section_text_ = iup.text{expand="HORIZONTAL", value="C100*50*5*7.5"}

local brace_section_label_ = iup.label{title="Section:"}
local brace_section_text_ = iup.text{expand="HORIZONTAL", value="L90*75*7"}

local rain_section_label_ = iup.label{title="Section:"}
local rain_section_text_ = iup.text{expand="HORIZONTAL", value="H90*75*5*7"}

local ok_ = iup.button{title="OK",rastersize="60X30"};
local cancel_ = iup.button{title="Cancel",rastersize="60X30"};

dlg_ = iup.dialog
{
	title="Model", 
	iup.vbox{
		iup.tabs{
			iup.vbox
			{
				tabtitle = "General",
				iup.hbox{plane_label_,ary_x_label_,ary_x_text_,ary_y_label_,ary_y_text_,ary_z_label_,ary_z_text_};
			};
			iup.vbox
			{
				tabtitle = "Column",
				iup.hbox{column_section_label_,column_section_text_};
			};
			iup.vbox
			{
				tabtitle = "Girder",
				iup.hbox{girder_section_label_,girder_section_text_};
			};
			iup.vbox
			{
				tabtitle = "Beam",
				iup.hbox{beam_section_label_,beam_section_text_};
			};
			iup.vbox
			{
				tabtitle = "Vault",
				iup.hbox{vault_section_label_,vault_section_text_};
			};
			iup.vbox
			{
				tabtitle = "Vault",
				iup.hbox{brace_section_label_,brace_section_text_};
			};
			iup.vbox
			{
				tabtitle = "Rain",
				iup.hbox{rain_section_label_,rain_section_text_};
			};
		};
		iup.hbox{ok_, cancel_};
		alignment="ARIGHT";
	};
	rastersize="500x", 
	margin="10x10";
}

local function add_ent(t,sc)
	t:set_mode_rendering();
	MGR.add(t);
	MGR.draw(t,sc);
	-- MGR.update(sc);
end

local function add_column(sc,ix,iy,iz,dx,dy,dz)
	local t =Member:new{Type="Column",Color={255,0,0},Section=column_section_text_.value};
	local x1,y1,z1 = 0,0,0;
	local x2,y2,z2 = 0,0,dz;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	t:set_mode_diagram();
	add_ent(t,sc);
end

local function add_girder_x(sc,ix,iy,iz,dx,dy,dz)
	local t =Member:new{Type="Girder",Color={0,0,255},Section=girder_section_text_.value};
	local x1,y1,z1 = 0,0,dz;
	local x2,y2,z2 = dx,0,dz;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	t:set_mode_diagram();
	t:align_bottom();
	add_ent(t,sc);
end

local function add_girder_y(sc,ix,iy,iz,dx,dy,dz)
	local t =Member:new{Type="Girder",Color={0,0,255},Section=girder_section_text_.value};
	local x1,y1,z1 = 0,0,dz;
	local x2,y2,z2 = 0,dy,dz;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	t:set_mode_diagram();
	t:align_bottom();
	add_ent(t,sc);
end

local function add_beam_x(sc,ix,iy,iz,dx,dy,dz)
	local t =Member:new{Type="Beam",Color={0,0,139},Section=beam_section_text_.value};
	local x1,y1,z1 = 0,dy/2,dz;
	local x2,y2,z2 = dx/3,dy/2,dz;
	local x3,y3,z3 = dx*2/3,dy/2,dz;
	local x4,y4,z4 = dx,dy/2,dz;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	t:add_pt{x3+(ix-1)*dx,y3+(iy-1)*dy,z3+(iz-1)*dz};
	t:add_pt{x4+(ix-1)*dx,y4+(iy-1)*dy,z4+(iz-1)*dz};
	t:set_mode_diagram();
	t:align_bottom();
	add_ent(t,sc);
end

local function add_vault_y(sc,ix,iy,iz,dx,dy,dz)
	local t =Member:new{Type="Vault",Color={255,0,180},Section=vault_section_text_.value};
	local x1,y1,z1 = dx/3,0,dz;
	local x2,y2,z2 = dx/3,dy,dz;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	t.Beta = 90;
	add_ent(t,sc);
	local t =Member:new{Type="Vault",Color={255,0,180},Section=vault_section_text_.value};
	local x1,y1,z1 = dx*2/3,0,dz;
	local x2,y2,z2 = dx*2/3,dy,dz;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	t.Beta = 90;
	add_ent(t,sc);
end

local function add_brace_x(sc,ix,iy,iz,dx,dy,dz)
	local t =Member:new{Type="Brace",Color={180,0,255},Section=brace_section_text_.value};
	local x1,y1,z1 = 0,0,0;
	local x2,y2,z2 = dx,0,dz;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	add_ent(t,sc);
	local t =Member:new{Type="Brace",Color={180,0,255},Section=brace_section_text_.value};
	local x1,y1,z1 = 0,0,dz;
	local x2,y2,z2 = dx,0,0;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	add_ent(t,sc);
end

local function add_brace_y(sc,ix,iy,iz,dx,dy,dz)
	local t =Member:new{Type="Brace",Color={180,0,255},Section=brace_section_text_.value};
	local x1,y1,z1 = 0,0,0;
	local x2,y2,z2 = 0,dy,dz;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	add_ent(t,sc);
	local t =Member:new{Type="Brace",Color={180,0,255},Section=brace_section_text_.value};
	local x1,y1,z1 = 0,0,dz;
	local x2,y2,z2 = 0,dy,0;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	add_ent(t,sc);
end

local function add_curved_beam_x(sc,ix,iy,iz,dx,dy,dz,way)
	local t =MemberArc:new{Type="Beam",Color={255,0,255},Section=rain_section_text_.value};
	local x1,y1,z1 = dx/2,0,dz;
	local x2,y2,z2 = dx/2,0,dz+way;
	local x3,y3,z3 = 0,0,dz;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	t:add_pt{x3+(ix-1)*dx,y3+(iy-1)*dy,z3+(iz-1)*dz};
	t.Angle=180;
	t.Beta=90;
	add_ent(t,sc);
end

local function add_curved_beam_y(sc,ix,iy,iz,dx,dy,dz,way)
	local t =MemberArc:new{Type="Beam",Color={255,0,255},Section=rain_section_text_.value};
	local x1,y1,z1 = 0,dy/2,dz;
	local x2,y2,z2 = 0,dy/2,dz+way;
	local x3,y3,z3 = 0,0,dz;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	t:add_pt{x3+(ix-1)*dx,y3+(iy-1)*dy,z3+(iz-1)*dz};
	t.Angle=180;
	t.Beta=90;
	add_ent(t,sc);
end

local function add_floor(sc,ix,iy,iz,dx,dy,dz)
	if not IO.is_there_file{file="app/Graphics/Rect.lua"} then return end
	local t =Rect:new{Type="Assistant",Color={128,128,128}};
	local x1,y1,z1 = 0,0,0;
	local x2,y2,z2 = dx/2,dy/2,0;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	add_ent(t,sc);
	local t =Rect:new{Type="Assistant",Color={128,128,128}};
	local x1,y1,z1 = dx,dy,0;
	local x2,y2,z2 = dx/2,dy/2,0;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	add_ent(t,sc);
end

local function add_line_x(sc,ix,dx,cy,dy)
	if not IO.is_there_file{file="app/Graphics/Line.lua"} then return end
	local t =Line:new{Type="Assistant",Color={0,255,0}};
	local x1,y1,z1 = 0,-dy,0;
	local x2,y2,z2 = 0,(cy+1)*dy,0;
	t:add_pt{x1+(ix-1)*dx,y1,0};
	t:add_pt{x2+(ix-1)*dx,y2,0};
	add_ent(t,sc);
end

local function add_line_y(sc,iy,dy,cx,dx)
	if not IO.is_there_file{file="app/Graphics/Line.lua"} then return end
	local t =Line:new{Type="Assistant",Color={0,255,0}};
	local x1,y1,z1 = -dx,0,0;
	local x2,y2,z2 = (cx+1)*dx,0,0;
	t:add_pt{x1,y1+(iy-1)*dy,0};
	t:add_pt{x2,y2+(iy-1)*dy,0};
	add_ent(t,sc);
end

local function add_plate(sc,ix,iy,iz,dx,dy,dz)
	local t =Plate:new{Type="Roof",Color={128,128,0},Mode="Diagram"};
	local x1,y1,z1 = 0,0,dz;
	local x2,y2,z2 = dx,dy,dz;
	t:add_pt{x1+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y1+(iy-1)*dy,z1+(iz-1)*dz};
	t:add_pt{x2+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	t:add_pt{x1+(ix-1)*dx,y2+(iy-1)*dy,z2+(iz-1)*dz};
	t.Thick = 20;
	t:align_top();
	add_ent(t,sc);
end

-- local function run()end

function ok_:action()
	local sc = MGR.get_cur_scene() or MGR.new_scene{name="Test"};
	
	local cx = tonumber(ary_x_text_.value); cx = cx<1 and 1 or cx;
	local cy = tonumber(ary_y_text_.value); cy = cy<1 and 1 or cy;
	local cz = tonumber(ary_z_text_.value); cz = cz<1 and 1 or cz;
	local dx = 7000;
	local dy = 5000;
	local dz = 3300;

	dlg_:hide();
	local run = PROGRESS.create{title="Create",count=(cx+1)*(cy+1)*cz+cx*cy+cx*2+1+cy*2+1,time=0.1};
	local function add_array_column_girder_beam_vault_brace()
		for ix=1,cx+1 do
			for iy=1, cy+1 do
				for iz=1, cz do
					add_column(sc,ix,iy,iz,dx,dy,dz);
					if ix<=cx then add_girder_x(sc,ix,iy,iz,dx,dy,dz) end
					if iy<=cy then add_girder_y(sc,ix,iy,iz,dx,dy,dz) end
					if ix<=cx and iy<=cy then add_beam_x(sc,ix,iy,iz,dx,dy,dz) end
					if ix<=cx and iy<=cy then add_vault_y(sc,ix,iy,iz,dx,dy,dz) end
					if ix<=cx then add_brace_x(sc,ix,iy,iz,dx,dy,dz) end
					if iy<=cy then add_brace_y(sc,ix,iy,iz,dx,dy,dz) end
					if ix<=cx and iy<=cy then add_plate(sc,ix,iy,iz,dx,dy,dz) end
					run();
				end
			end
		end
	end
	local function add_array_floor_plate()
		for ix=1,cx do
			for iy=1, cy do
				add_floor(sc,ix,iy,1,dx,dy,dz)
				run();
			end
		end
	end
	local function add_array_curved_beam()
		for ix=1,cx do
			add_curved_beam_x(sc,ix,1,cz,dx,dy,dz,1)
			add_curved_beam_x(sc,ix,cy+1,cz,dx,dy,dz,-1)
			run();
		end
		for iy=1,cy do
			add_curved_beam_y(sc,1,iy,cz,dx,dy,dz,-1)
			add_curved_beam_y(sc,cx+1,iy,cz,dx,dy,dz,1)
			run();
		end
	end
	local function add_array_line()
		for ix=1,cx+1 do
			add_line_x(sc,ix,dx,cy,dy);
			run();
		end
		for iy=1,cy+1 do
			add_line_y(sc,iy,dy,cx,dx);
			run();
		end
	end
	add_array_column_girder_beam_vault_brace();
	add_array_floor_plate();
	add_array_curved_beam();
	add_array_line();
	-- add_column(sc,1,1,1,dx,dy,dz);
	-- add_plate(sc,1,1,1,dx,dy,dz);
	STATUSBAR.show_model_count();
	MGR.update(sc);
	MGR.model_commit();
end

function dlg_:k_any(n)
	if n==iup.K_CR then ok_:action() end
end

function cancel_:action()
	dlg_:hide();
end

function pop()
	dlg_:show()
end

function on_start(arg)
	pop();
	-- CMD.set{command=CREATE.new{class=Member:new{Type="Column",Color={255,0,100},Section="S100*100*16",Beta=0}:set_mode_rendering()}:set_step_count(1)};
end

