_ENV = module(...,ap.adv)

local MGR = require'sys.mgr'
local VIEW = require'sys.View'

-- function New(sc,id)
	-- if not id then sc = nil end;
	-- local ents = require"sys.mgr".curs();
	-- local new_sc = require"sys.mgr".new_scene{scene=sc};
	-- require"sys.mgr".get_view(new_sc):set_states(sc);
	-- for k,v in pairs(ents) do
		-- require"sys.mgr".draw(v,new_sc);
	-- end
	-- require"sys.mgr".update(new_sc);
-- end
function New(sc,id)
	sc = id and sc or nil;
	local ents = MGR.curs();
	VIEW.new_view{ents=ents,scene=sc};
end

function Fit(sc)
	MGR.scene_to_fit{scene=sc,ents=MGR.get_scene_all(sc)};
	MGR.update(sc);
end


--[[
local function Show(sc)
	local ents = MGR.get_scene_all();
	if not ents then return end
	local run = require"sys.progress".create{title="All",count=require"sys.table".count(ents),time=1};
	for k,v in pairs(ents) do
		v = MGR.get_table(k,v);
		if require"sys.Entity".Class.is_hidden(v) then 
			require"sys.Entity".Class.show(v);
			MGR.redraw(v,sc);
		end
		run();
	end
	MGR.update();
end

local function Hide(sc)
	local ents = MGR.curs();
	if not ents then return end
	local run = require"sys.progress".create{title="Hide",count=require"sys.table".count(ents),time=1};
	for k,v in pairs(ents) do
		if not require"sys.Entity".Class.is_hidden(v) then 
			require"sys.Entity".Class.hide(v);
			MGR.redraw(v,sc);
		end
		run();
	end
	MGR.update();
end
--]]

function Show(sc)
	sc = sc or MGR.get_cur_scene();
	local ents = MGR.curs();
	if not ents then return end
	local run = require"sys.progress".create{title="Hide",count=require"sys.table".count(ents),time=1};
	for k,v in pairs(ents) do
		v = MGR.get_table(k,v);
		MGR.draw(v,sc);
		run();
	end
	MGR.update();
end

function Hide(sc)
	sc = sc or MGR.get_cur_scene();
	local ents = MGR.get_scene_selection();
	if not ents then return end
	local run = require"sys.progress".create{title="Hide",count=require"sys.table".count(ents),time=1};
	for k,v in pairs(ents) do
		v = MGR.get_table(k,v);
		MGR.hide(v,sc);
		run();
	end
	MGR.update();
end

function Zoomin(sc)
	local zoom = MGR.scene_get_scale{scene=sc}
	zoom = zoom * 1.1;
	MGR.scene_set_scale{scene=sc,zoom=zoom,update=true}
end

function Zoomout(sc)
	local zoom = MGR.scene_get_scale{scene=sc}
	zoom = zoom / 1.1;
	MGR.scene_set_scale{scene=sc,zoom=zoom,update=true}
end

function load()
	require"sys.menu".add{name={"View"},pos={"Window"}};
	require"sys.menu".add{frame=true,view=true,app="View",name={"View","New"},f=New};
	require"sys.menu".add{view=true,app="View",name={"View","Show"},f=Show};
	require"sys.menu".add{view=true,app="View",name={"View","Hide"},f=Hide};
	require"sys.menu".add{view=true,app="View",name={"View","Fit"},f=Fit};
	-- require"sys.menu".add{view=true,app="View",name={"View","Mode","Default"},f=function(sc)require"sys.mgr".scene_to_default{scene=sc,update=true}end};
	require"sys.menu".add{view=true,app="View",name={"View","Mode","3D"},f=function(sc)require"sys.mgr".scene_to_3d{scene=sc,update=true}end};
	require"sys.menu".add{view=true,app="View",name={"View","Mode","Top"},f=function(sc)require"sys.mgr".scene_to_top{scene=sc,update=true}end};
	require"sys.menu".add{view=true,app="View",name={"View","Mode","Front"},f=function(sc)require"sys.mgr".scene_to_front{scene=sc,update=true}end};
	require"sys.menu".add{view=true,app="View",name={"View","Mode","Back"},f=function(sc)require"sys.mgr".scene_to_back{scene=sc,update=true}end};
	require"sys.menu".add{view=true,app="View",name={"View","Mode","Left"},f=function(sc)require"sys.mgr".scene_to_left{scene=sc,update=true}end};
	require"sys.menu".add{view=true,app="View",name={"View","Mode","Right"},f=function(sc)require"sys.mgr".scene_to_right{scene=sc,update=true}end};
	require"sys.menu".add{view=true,app="View",name={"View","Mode","Bottom"},f=function(sc)require"sys.mgr".scene_to_bottom{scene=sc,update=true}end};
	require"sys.menu".add{view=true,frame=true,app="View",name={"View","Workspace"},f=function()dlgtree_show(frm,not dlgtree_visible(frm));end};
end


