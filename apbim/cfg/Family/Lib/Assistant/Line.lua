local pairs = pairs
local require = require
local type = type
local trace_out = trace_out

_ENV = module(...)

local MGR = require'sys.mgr'
local ENT = require"sys.Entity"
local GEO = require"sys.geometry"
local CMD = require'sys.cmd'
local CREATE = require'app.Edit.Create'

local iup = require"iuplua"

local Path = 'cfg/Family/Lib/Assistant/'
local Name = 'Line'
Readme = {title=Name,icon=Path..Name..'.bmp',tip='',remark=''}

local Color = {r=0,g=0,b=255}

local CR = iup.toggle{title="Color :",size="50x"};
local CRR = iup.toggle{title="R="};
local CRG = iup.toggle{title="G="};
local CRB = iup.toggle{title="B="};
local CRr = iup.text{expand="horizontal",value='255'};
local CRg = iup.text{expand="horizontal",value='255'};
local CRb = iup.text{expand="horizontal",value='255'};
local PT1 = iup.toggle{title="Point1 :",size="50x"};
local PT1X = iup.toggle{title="X="};
local PT1Y = iup.toggle{title="Y="};
local PT1Z = iup.toggle{title="Z="};
local PT1x = iup.text{expand="horizontal",value='0'};
local PT1y = iup.text{expand="horizontal",value='0'};
local PT1z = iup.text{expand="horizontal",value='0'};
local PT2 = iup.toggle{title="Point2 :",size="50x"};
local PT2X = iup.toggle{title="X="};
local PT2Y = iup.toggle{title="Y="};
local PT2Z = iup.toggle{title="Z="};
local PT2x = iup.text{expand="horizontal",value='0'};
local PT2y = iup.text{expand="horizontal",value='0'};
local PT2z = iup.text{expand="horizontal",value='0'};
local CKALL = iup.toggle{title="Check",size="50x"};
local Apply = iup.button{title="Apply",size="50x15"};
local Modify = iup.button{title="Modify",size="50x15"};
local Cancel = iup.button{title="Cancel",size="50x15"};

local DLG = iup.dialog{
	title = "Line";
	margin = "5x5";
	size = "320x";
	iup.vbox{
		iup.hbox{CR,CRR,CRr,CRG,CRg,CRB,CRb};
		iup.hbox{PT1,PT1X,PT1x,PT1Y,PT1y,PT1Z,PT1z};
		iup.hbox{PT2,PT2X,PT2x,PT2Y,PT2y,PT2Z,PT2z};
		iup.hbox{CKALL,iup.fill{},Apply,Modify,Cancel};
	};
};

function CR:action()
	if CR.value=='ON' then 
		CRR.value = "ON"
		CRG.value = "ON"
		CRB.value = 'ON';
	else
		CRR.value = "OFF"
		CRG.value = "OFF"
		CRB.value = 'OFF';
	end
end

function PT1:action()
	if PT1.value=='ON' then 
		PT1X.value = "ON"
		PT1Y.value = "ON"
		PT1Z.value = 'ON';
	else
		PT1X.value = "OFF"
		PT1Y.value = "OFF"
		PT1Z.value = 'OFF';
	end
end

function PT2:action()
	if PT2.value=='ON' then 
		PT2X.value = "ON"
		PT2Y.value = "ON"
		PT2Z.value = 'ON';
	else
		PT2X.value = "OFF"
		PT2Y.value = "OFF"
		PT2Z.value = 'OFF';
	end
end

function CKALL:action()
	if CKALL.value=='ON' then 
		CR.value = "ON"
		PT1.value = "ON"
		PT2.value = 'ON';
	else
		CR.value = "OFF"
		PT1.value = "OFF"
		PT2.value = 'OFF';
	end
	CR:action()
	PT1:action()
	PT2:action()
end


local function init_dlg()
	local cur = MGR.cur();
	-- if type(cur)~="table" then return end
	CRr.value = cur and (cur.Color.r or cur.Color[1]) or Color.r;
	CRg.value = cur and (cur.Color.g or cur.Color[2]) or Color.g;
	CRb.value = cur and (cur.Color.b or cur.Color[3]) or Color.b;
	PT1x.value = cur and (cur.Points[1].x or cur.Points[1][1]);
	PT1y.value = cur and (cur.Points[1].y or cur.Points[1][2]);
	PT1z.value = cur and (cur.Points[1].z or cur.Points[1][3]);
	PT2x.value = cur and (cur.Points[2].x or cur.Points[2][1]);
	PT2y.value = cur and (cur.Points[2].y or cur.Points[2][2]);
	PT2z.value = cur and (cur.Points[2].z or cur.Points[2][3]);
end

function Apply:action()
	if CRR.value=="ON" then Color.r = CRr.value end
	if CRG.value=="ON" then Color.g = CRg.value end
	if CRB.value=="ON" then Color.b = CRb.value end
end

function Modify:action()
	local curs = MGR.curs();
	if type(curs)~="table" then return end
	for k,v in pairs(curs) do
		if type(v)=="table" then
			if CRR.value=="ON" then v.Color.r = CRr.value end
			if CRG.value=="ON" then v.Color.g = CRg.value end
			if CRB.value=="ON" then v.Color.b = CRb.value end
			if PT1X.value=="ON" then v.Points[1].x = PT1x.value end
			if PT1Y.value=="ON" then v.Points[1].y = PT1y.value end
			if PT1Z.value=="ON" then v.Points[1].z = PT1z.value end
			if PT2X.value=="ON" then v.Points[2].x = PT2x.value end
			if PT2Y.value=="ON" then v.Points[2].y = PT2y.value end
			if PT2Z.value=="ON" then v.Points[2].z = PT2z.value end
			v:modify();
		end
	end
end

function Cancel:action()
	DLG:hide();
end

function pop()
	init_dlg();
	DLG:show();
end


Class = {
	Classname = Path..Name;
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

Starts = {}
Starts.Create = function()
	CMD.set{command=CREATE.new{class=Class:new{Color={Color.r,Color.g,Color.b}}}:set_step_count(2)};
end
Starts.Property = function()
	CMD.set_idle();
	pop();
end

function on_start(arg)
	if type(Starts[arg.mode])=='function' then Starts[arg.mode]() end
end

