local require = require

_ENV = module(...)

local ENT = require"sys.Entity"
local GEO = require"sys.geometry"
local CMD = require'sys.cmd'
local CREATE = require'app.Edit.Create'

local iup = require"iuplua"

local PT1 = iup.label{title="Point1:"};
local PT1X = iup.toggle{title="X="};
local PT1Y = iup.toggle{title="Y="};
local PT1Z = iup.toggle{title="Z="};
local Pt1x = iup.text{expand="horizontal"};
local Pt1y = iup.text{expand="horizontal"};
local Pt1z = iup.text{expand="horizontal"};
local PT2 = iup.label{title="Point2:"};
local PT2X = iup.toggle{title="X="};
local PT2Y = iup.toggle{title="Y="};
local PT2Z = iup.toggle{title="Z="};
local Pt2x = iup.text{expand="horizontal"};
local Pt2y = iup.text{expand="horizontal"};
local Pt2z = iup.text{expand="horizontal"};
local OK = iup.button{title="OK",size="50x15"};
local CANCEL = iup.button{title="Cancel",size="50x15"};

local DLG = iup.dialog{
	title = "Line";
	margin = "5x5";
	size = "320x";
	iup.vbox{
		iup.hbox{PT1,PT1X,Pt1x,PT1Y,Pt1y,PT1Z,Pt1z};
		iup.hbox{PT2,PT2X,Pt2x,PT2Y,Pt2y,PT2Z,Pt2z};
		iup.hbox{OK,CANCEL};
		alignment = "aRight";
	};
};

local function init_dlg()
	local cur = require"sys.mgr".cur();
	if type(cur)~="table" then return end
	Pt1x.value = cur.Points[1].x or cur.Points[1][1];
	Pt1y.value = cur.Points[1].y or cur.Points[1][2];
	Pt1z.value = cur.Points[1].z or cur.Points[1][3];
	Pt2x.value = cur.Points[2].x or cur.Points[2][1];
	Pt2y.value = cur.Points[2].y or cur.Points[2][2];
	Pt2z.value = cur.Points[2].z or cur.Points[2][3];
end

function OK:action()
	local curs = require"sys.mgr".curs();
	if type(curs)~="table" then return end
	for k,v in pairs(curs) do
		if type(v)=="table" then 
			if PT1X.value=="ON" then 
				v.Points[1].x = Pt1x.value;
				v.Points[1].y = Pt1y.value;
				v.Points[1].z = Pt1z.value;
			end
			if PT2X.value=="ON" then 
				v.Points[2].x = Pt2x.value;
				v.Points[2].y = Pt2y.value;
				v.Points[2].z = Pt2z.value;
			end
			v:modified();
		end
	end
	DLG:hide();
end

function CANCEL:action()
	DLG:hide();
end

function pop()
	init_dlg();
	DLG:show();
end


Class = {
	Classname = 'cfg/Family/Lib/Assistant/Line';
	-- Points = {[1],[2]};
	-- Color = {0,0,255};
};
ENT.Class:met(Class);

function Class:on_edit()
	pop();
end

function Class:on_draw(arg)
	local cr = GEO.Color:new(self.Color or {0,0,255}):get_gl()
	local pt1 = self:get_pt(1);
	local pt2 = self:get_pt(2);
	return {
		surfaces = {
			{
				points = {
					{cr.r,cr.g,cr.b,1,1,pt1.x,pt1.y,pt1.z};
					{cr.r,cr.g,cr.b,1,1,pt2.x,pt2.y,pt2.z};
				};
				lines = {{1,2}};
			};
		};
	};
end

function on_readme()
	return {title="Line",icon=Class.Classname..'.bmp',tip="Assistant Line"}
end

function on_create(arg)
	CMD.set{command=CREATE.new{class=Class:new()}:set_step_count(2)};
end

