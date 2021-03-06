_ENV = module(...,ap.adv)

local TAB = require'sys.table'
local SHP = require'sys.api.shape'

Diagram = "Diagram";
Wireframe = "Wireframe";
Rendering = "Rendering";

Class = {
	Classname = "sys/Entity";
	-- Mode = "Diagram"/"Wireframe"/"Rendering";
	-- Show_Text = nil;
	-- Hidden = true;
	-- Color = {};
	-- Points = {};
};
require"sys.Item".Class:met(Class);

--callback

-- arg={mode=Diagram/Wireframe/Rendering}
function Class:on_draw(arg)end
-- function Class:on_draw_diagram()end
-- function Class:on_draw_wireframe()end
-- function Class:on_draw_rendering()end
function Class:update_data()end

--------Hidden--------

function Class:is_hidden()
	if type(self)~="table" then return true end
	return self.Hidden;
end

function Class:hide()
	if type(self)~="table" then return self end
	if self.Hidden then return self end
	self.Hidden = true;
	require"sys.Item".Class.modify(self);
	return self;
end

function Class:show()
	if type(self)~="table" then return self end
	if not self.Hidden then return self end
	self.Hidden = nil;
	require"sys.Item".Class.modify(self);
	return self;
end

function Class:is_show_text()
	if type(self)~="table" then return true end
	return self.Show_Text;
end

function Class:show_text()
	if type(self)~="table" then return self end
	if self.Show_Text then return self end
	self.Show_Text = true;
	require"sys.Item".Class.modify(self);
	return self;
end

function Class:hide_text()
	if type(self)~="table" then return self end
	if not self.Show_Text then return self end
	self.Show_Text = nil;
	require"sys.Item".Class.modify(self);
	return self;
end


--------Mode--------

function Class:set_mode(md)
	if type(self)~="table" then return self end
	if self.Mode == md then return self end
	self.Mode = md;
	require"sys.Item".Class.modify(self);
	return self;
end

function Class:get_mode(md)
	if type(self)~="table" then return md end
	md = md or self.Mode;
	if tostring(md)==Diagram then return md end
	if tostring(md)==Wireframe then return md end
	if tostring(md)==Rendering then return md end
	return Diagram;
end

function Class:set_mode_diagram()
	if type(self)~="table" then return self end
	if self.Mode == Diagram then return self end
	self.Mode = Diagram;
	require"sys.Item".Class.modify(self);
	return self;
end

function Class:set_mode_wireframe()
	if type(self)~="table" then return self end
	if self.Mode == Wireframe then return self end
	self.Mode = Wireframe;
	require"sys.Item".Class.modify(self);
	return self;
end

function Class:set_mode_rendering()
	if type(self)~="table" then return self end
	if self.Mode == Rendering then return self end
	self.Mode = Rendering;
	require"sys.Item".Class.modify(self);
	return self;
end

--------Shape--------

-- function Class:get_placement()
	-- if type(self)~="table" then return nil end
	-- if type(self.on_place)=="function" then return self:on_place() end
-- end

function Class:get_shape(arg)
	if type(self)~="table" then return nil end
	if type(arg)~='table' then return end
	if type(arg.mode)~='string' then return end
	local shp = nil;
	if type(self.Shape)=='table' and type(self.Shape[arg.mode])=='table' then 
		shp = TAB.deepcopy(self.Shape[arg.mode]) 
	elseif type(self.on_draw)=="function" then
		shp = self:on_draw(arg)
	end
	local crd = type(self.on_place)=="function" and self:on_place()
	if type(shp)=='table' and type(crd)=='table' then SHP.coord_l2g(shp,crd) end
	return shp
end

function Class:set_shape(t)
	self.Shape = t;
	self:modify();
end

function Class:set_shape_diagram(t)
	if type(self.Shape)~='table' then self.Shape = {} end
	self.Shape.Diagram = t;
	self:modify();
end

function Class:set_shape_wireframe(t)
	if type(self.Shape)~='table' then self.Shape = {} end
	self.Shape.Wireframe = t;
	self:modify();
end

function Class:set_shape_rendering(t)
	if type(self.Shape)~='table' then self.Shape = {} end
	self.Shape.Rendering = t;
	self:modify();
end

--------Color--------

--[[
function Class:set_color(cr)
	if type(self)~="table" then return self end
	if self.Color == cr then return self end
	self.Color = cr;
	require"sys.Item".Class.modify(self);
	return self;
end

function Class:get_color()
	if type(self)~="table" then return {0,0,0} end
	return require"sys.geometry".Color:new(self.Color);
end

function Class:get_color_gl()
	if type(self)~="table" then return {0,0,0} end
	local cr = self.get_color(self);
	local r = cr.r or cr[1] or 0;
	local g = cr.g or cr[2] or 0;
	local b = cr.b or cr[3] or 0;
	local cr = {r/255,g/255,b/255};
	return require"sys.geometry".Color:new(cr);
end
--]]

-- function Class:get_color()
	-- local cr = type(self)=="table" and type(self.Color)=="table" and self.Color or {0,0,0};
	-- return require"sys.geometry".Color:new(cr);
-- end

-- function Class:get_color_gl()
	-- if type(self)~="table" or type(self.Color)~="table" then return {0,0,0} end
	-- local r = self.Color.r or self.Color[1] or 0;
	-- local g = self.Color.g or self.Color[2] or 0;
	-- local b = self.Color.b or self.Color[3] or 0;
	-- local cr = {r/255,g/255,b/255};
	-- return require"sys.geometry".Color:new(cr);
-- end

--------Points--------

function Class:set_pts(pts)
	if type(self)~="table" then return self end
	self.Points = pts;
	require"sys.Item".Class.modify(self);
	return self;
end

function Class:get_pts()
	if type(self)~="table" then return nil end
	if type(self.Points)~="table" then return {} end
	for k,v in pairs(self.Points) do
		require"sys.geometry".Point:new(v);
	end
	return self.Points;
end

function Class:add_pts(pts)
	if type(self)~="table" then return self end
	if type(pts)~="table" then return self end
	for i,v in ipairs(pts) do
		self:add_pt(v);
	end
	return self;
end

function Class:add_pt(v)
	if type(self.Points)~="table" then self.Points={} end
	local k = #self.Points+1;
	self.Points[#self.Points+1] = v;
	require"sys.Item".Class.modify(self);
	return self;
end

function Class:set_pt(k,v)
	if type(self.Points)~="table" then self.Points={} end
	if type(k)=="number" and k<0 then k=#self.Points+k+1 end
	self.Points[k] = v;
	require"sys.Item".Class.modify(self);
	return self;
end

function Class:get_pt(k)
	if type(self.Points)~="table" then return require"sys.geometry".Point:new{0,0,0} end
	if type(k)=="number" and k<0 then k=#self.Points+k+1 end
	if type(self.Points[k])~="table" then return require"sys.geometry".Point:new{0,0,0} end
	require"sys.geometry".Point:new(self.Points[k]);
	return self.Points[k];
end

function Class:get_length()
	if type(self.Points)~="table" then return 0 end
	if #self.Points<=1 then return 0 end
	local sum = 0;
	for i,v in ipairs(self.Points) do
		if i>1 then sum = sum+require"sys.geometry".Point:new(v):distance(self.Points[i-1]) end
	end
	return sum;
end

function Class:get_foucs_pt()
	if type(self.Points)~="table" then return nil end
	if #self.Points<=0 then return require"sys.geometry".Point:new{0,0,0} end
	return require"sys.geometry".Point:new(self.Points[1]);
end


function get_ent_box(ent)
	if type(ent)~="table" then return end
	local pt1={};
	local pt2={};
	local pts = type(ent.Points)=='table' and ent.Points or {}
	for k,v in pairs(pts) do
		if type(v)=="table" then
			local pt = require"sys.geometry".Point:new(v);
			pt1 = require"sys.geometry".box_min_pt(pt1,pt);
			pt2 = require"sys.geometry".box_max_pt(pt2,pt);
		end
	end
	if type(ent.Shape)=='table' then
		if type(ent.Shape.Diagram)=='table' and type(ent.Shape.Diagram.surfaces)=='table' and type(ent.Shape.Diagram.surfaces[1])=='table' and type(ent.Shape.Diagram.surfaces[1].points)=='table' and type(ent.Shape.Diagram.surfaces[1].points[1])=='table' then
			local pt = require"sys.geometry".Point:new{ent.Shape.Diagram.surfaces[1].points[1][6],ent.Shape.Diagram.surfaces[1].points[1][7],ent.Shape.Diagram.surfaces[1].points[1][8]};
			pt1 = require"sys.geometry".box_min_pt(pt1,pt);
			pt2 = require"sys.geometry".box_max_pt(pt2,pt);
		elseif type(ent.Shape.Wireframe)=='table' and type(ent.Shape.Wireframe.surfaces)=='table' and type(ent.Shape.Wireframe.surfaces[1])=='table' and type(ent.Shape.Wireframe.surfaces[1].points)=='table' and type(ent.Shape.Wireframe.surfaces[1].points[1])=='table' then
			local pt = require"sys.geometry".Point:new{ent.Shape.Wireframe.surfaces[1].points[1][6],ent.Shape.Wireframe.surfaces[1].points[1][7],ent.Shape.Wireframe.surfaces[1].points[1][8]};
			pt1 = require"sys.geometry".box_min_pt(pt1,pt);
			pt2 = require"sys.geometry".box_max_pt(pt2,pt);
		elseif type(ent.Shape.Rendering)=='table' and type(ent.Shape.Rendering.surfaces)=='table' and type(ent.Shape.Rendering.surfaces[1])=='table' and type(ent.Shape.Rendering.surfaces[1].points)=='table' and type(ent.Shape.Rendering.surfaces[1].points[1])=='table' then
			local pt = require"sys.geometry".Point:new{ent.Shape.Rendering.surfaces[1].points[1][6],ent.Shape.Rendering.surfaces[1].points[1][7],ent.Shape.Rendering.surfaces[1].points[1][8]};
			pt1 = require"sys.geometry".box_min_pt(pt1,pt);
			pt2 = require"sys.geometry".box_max_pt(pt2,pt);
		end
	end
	return {pt1,pt2};
end
function get_ents_box(ents)
	if type(ents)~="table" then return end
	local pt1={};
	local pt2={};
	-- local run = require"sys.progress".create{title="Calculating(Box) ... ",count=require"sys.table".count(ents),time=0.1,update=false};
	for k,v in pairs(ents) do
		v = require"sys.mgr".get_table(k,v);
		local box = get_ent_box(v);
		if type(box)=="table" then
			pt1 = require"sys.geometry".box_min_pt(pt1,box[1]);
			pt2 = require"sys.geometry".box_max_pt(pt2,box[2]);
		end
		-- run();
	end
	local pt1 = require"sys.geometry".Point:new(pt1);
	local pt2 = require"sys.geometry".Point:new(pt2);
	local cpt = (pt1+pt2)*0.5;
	return {pt1,pt2,center=require"sys.geometry".Point:new(cpt)};
end
