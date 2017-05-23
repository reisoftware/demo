_ENV = module(...,ap.adv)

local ENT = require'sys.Entity'.Class
local TAB = require'sys.api.table'
local VIEW = require'sys.View'
local SHAPE = require'sys.api.shape'

---------------------------------------------

local function add_obj(frm,obj)
	-- require"sys.mgr.scene.object".set(obj);
end

local function scene_addobj(sc,obj)
	require"sys.mgr.scene.object".add(sc,obj);
end

local function scene_delobj(sc,obj)
	require"sys.mgr.scene.object".del(sc,obj);
end


--------------------------------------------

local dark_ceo_ = 0.5; --coefficient
local body_light_ = {1,1,1};
local side_light_ = {0,0,1};
local side_dark_ = {0.1,0.1,0.1};
local get_object_by_mode_ = {};

get_object_by_mode_.Diagram = function(ent,light,sc)
	local diagram = ENT.get_shape(ent,{mode='Diagram'});
	if type(diagram)~="table" then return end
	local obj = TAB.deepcopy(diagram);
	
	local crd = ENT.get_placement(ent);
	if type(crd)=='table' then SHAPE.coord_l2g(obj,crd) end
	
	local cr = VIEW.get_color(sc,ent.mgrid);
	if type(cr)=="table" then SHAPE.color_to(obj,require"sys.geometry".Color:new(cr):get_gl()) end
	-- SHAPE.color_scale(obj,dark_ceo_);
	if light then SHAPE.color_to(obj,body_light_) SHAPE.text_color_to(obj,body_light_) end
	return obj;
end

get_object_by_mode_.Wireframe = function(ent,light,sc)
	local wireframe = ENT.get_shape(ent,{mode='Wireframe'});
	if type(wireframe)~="table" then return get_object_by_mode_.Diagram(ent,light) end
	local obj = TAB.deepcopy(wireframe);
	
	local crd = ENT.get_placement(ent);
	if type(crd)=='table' then SHAPE.coord_l2g(obj,crd) end
	
	local cr = VIEW.get_color(sc,ent.mgrid);
	if type(cr)=="table" then SHAPE.color_to(obj,require"sys.geometry".Color:new(cr):get_gl()) end
	if light then SHAPE.color_to(obj,body_light_) end
	return obj;
end

get_object_by_mode_.Rendering = function(ent,light,sc)
	local rendering = ENT.get_shape(ent,{mode='Rendering'});
	if type(rendering)~="table" then return get_object_by_mode_.Diagram(ent,light) end
	local body = TAB.deepcopy(rendering);

	local crd = ENT.get_placement(ent);
	if type(crd)=='table' then SHAPE.coord_l2g(body,crd) end
	
	local cr = VIEW.get_color(sc,ent.mgrid);
	if type(cr)=="table" then SHAPE.color_to(body,require"sys.geometry".Color:new(cr):get_gl()) end
	if light then SHAPE.color_to(body,body_light_) end

	local wireframe = ENT.get_shape(ent,{mode='Wireframe'});
	if type(wireframe)~="table" then return body end
	local side = TAB.deepcopy(wireframe);
	
	if type(crd)=='table' then SHAPE.coord_l2g(side,crd) end

	if light then SHAPE.color_to(side,side_light_) else SHAPE.color_to(side,side_dark_) end
	return SHAPE.merge{body,side};
end

local function get_object(ent,light,sc)
	local mode = VIEW.get_mode(sc,ent.mgrid) or ENT.get_mode(ent);
	
	if type(get_object_by_mode_[mode])~="function" then mode = "diagram" end
	local obj = get_object_by_mode_[mode](ent,light,sc);
	-- if ENT.is_show_text(ent) then  obj = SHAPE.merge{obj,get_text_obj(ent,light)}; end
	-- obj = SHAPE.merge{obj,get_text_obj(ent,light)};
	return obj;
end

local function add(ent,light,sc)
	if not sc then return end;
	if type(ent)~="table" then trace_out("sys.mgr.draw.set(ent,sc): ent isn't a table\n") return end
	if type(ent.mgrid)~="string" then trace_out("sys.mgr.draw.del(ent,sc): ent.mgrid isn't a string\n") return end
	local obj = get_object(ent,light,sc);
	if type(obj)~="table" then return end
	obj.index = require"sys.mgr.scene.index".get_objid(ent.mgrid,sc);
	if type(obj.index)~="number" then return end
	add_obj(frm,obj);
	-- if not sc then return end
	scene_addobj(sc,obj);
	require"sys.mgr.scene.item".add(sc,ent.mgrid);
end

function del(ent,sc)
	if not sc then return end;
	if type(ent)~="table" then trace_out("sys.mgr.draw.set(ent,sc): ent isn't a table\n") return end
	if type(ent.mgrid)~="string" then trace_out("sys.mgr.draw.del(ent,sc): ent.mgrid isn't a string\n") return end
	local obj = {}
	obj.index = require"sys.mgr.scene.index".get_objid(ent.mgrid,sc);
	if type(obj.index)~="number" then return end
	add_obj(frm,obj);
	-- if not sc then return end
	scene_delobj(sc,obj)
	require"sys.mgr.scene.item".del(sc,ent.mgrid);
end

function set(ent,light,sc)
	if not sc then return end;
	if type(ent)~="table" then trace_out("sys.mgr.draw.set(ent,sc): ent isn't a table\n") return end
	if type(ent.mgrid)~="string" then trace_out("sys.mgr.draw.del(ent,sc): ent.mgrid isn't a string\n") return end
	if require"sys.Item".Class.is_deleted(ent) then
		del(ent,sc);
	elseif ENT.is_hidden(ent) then
		-- hide(ent,sc);
		del(ent,sc);
	else
		add(ent,light,sc);
	end
end

function reset(ent,light)
	-- set(ent,light,sc);
	-- require"sys.mgr.scene.item".reset(ent);
	if type(ent)~="table" then trace_out("sys.mgr.draw.reset(ent,sc): ent isn't a table\n") return end
	if type(ent.mgrid)~="string" then trace_out("sys.mgr.draw.del(ent,sc): ent.mgrid isn't a string\n") return end
	local scs = require"sys.mgr.scene.item".get_id_sc_ks(ent.mgrid);
	if type(scs)~="table" then return end
	for k,v in pairs(scs) do
		set(ent,light,k);
	end
end

