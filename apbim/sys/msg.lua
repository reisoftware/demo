
local action_ = require'sys.res.id_mgr'	
local MGR = require'sys.mgr';
local CMD = require'sys.cmd';
local STATUSBAR = require'sys.statusbar';
local SELECT = require'sys.msg.select';
local OBJECT = require'sys.mgr.scene.object';
local DRAG = require'sys.mgr.drag';
local ID = require'sys.msg.id';

function create_dlgtree()
end

function frm_on_command(id)
	ID.frm_on_command(id);
end
function frm_on_command(id)
	local f = action_.get_frame_action(id);
	if type(f)=='function' then f(id) end
end

function on_command(id,scene)
	MGR.set_cur_scene(scene);
	ID.on_command(id,scene);
	STATUSBAR.update();
end
function on_command(id,sc)
	local f = action_.get_action(id);
	if type(f)=='function' then f(sc,id) else trace_out("msg: on_command, id = "..id.."\n") end
end

function on_timer(scene,id)
-- require'sys.table'.totrace{msg_on_timer=id};
	MGR.set_cur_scene(scene);
	ID.on_timer(scene,id);
	-- STATUSBAR.update();
end

function on_paint(scene)
	MGR.set_cur_scene(scene);
	CMD.on_paint(scene)
	STATUSBAR.update();
end

function render_objs(scene)
	MGR.set_cur_scene(scene);
	OBJECT.on_draw(scene)
end

function render_drags(scene)
	MGR.set_cur_scene(scene);
	DRAG.on_draw(scene)
end

function free_scene(scene)
	MGR.close_scene(scene);
	STATUSBAR.update();
end

function begin_select()
	SELECT.start();
end

function select_main(index)
	SELECT.step(index);
end

function end_select()
	SELECT.stop();
	MGR.update();
	STATUSBAR.update();
end
function on_mousemove(scene,flags,x,y)
	CMD.on_mousemove(scene,flags,x,y)
end
function on_lbuttondown(scene,flags,x,y)
	MGR.set_cur_scene(scene);
	CMD.on_lbuttondown(scene,flags,x,y)
	STATUSBAR.update();
end
function on_lbuttonup(scene,flags,x,y)
	MGR.set_cur_scene(scene);
	CMD.on_lbuttonup(scene,flags,x,y)
	STATUSBAR.update();
end
function on_lbuttondblclk(scene,flags,x,y)
	MGR.set_cur_scene(scene);
	MGR.edit_property(scene);
	CMD.on_lbuttondblclk(scene,flags,x,y)
	STATUSBAR.update();
end
function on_mbuttondown(scene,flags,x,y)
	MGR.set_cur_scene(scene);
	CMD.on_mbuttondown(scene,flags,x,y)
	STATUSBAR.update();
end
function on_mbuttonup(scene,flags,x,y)
	MGR.set_cur_scene(scene);
	CMD.on_mbuttonup(scene,flags,x,y)
	STATUSBAR.update();
end
function on_mbuttondblclk(scene,flags,x,y)
	MGR.set_cur_scene(scene);
	CMD.on_mbuttondblclk(scene,flags,x,y)
	MGR.scene_to_fit{scene=scene,ents=MGR.get_scene_all(scene)};
	STATUSBAR.update();
end
function on_rbuttondown(scene,flags,x,y)
	MGR.set_cur_scene(scene);
	CMD.on_rbuttondown(scene,flags,x,y)
	STATUSBAR.update();
end
function on_rbuttonup(scene,flags,x,y)
	MGR.set_cur_scene(scene);
	CMD.on_rbuttonup(scene,flags,x,y)
	STATUSBAR.update();
end
function on_rbuttondblclk(scene,flags,x,y)
	MGR.set_cur_scene(scene);
	CMD.on_rbuttondblclk(scene,flags,x,y)
	STATUSBAR.update();
end

function on_keydown(scene,key)
	MGR.set_cur_scene(scene);
	require"sys.msg.keydown".call(scene,key);
	STATUSBAR.update();
end

function scene_onsize(scene,cx,cy)
	require"sys.mgr.scene".set_size(scene,cx,cy);
end


function onchat(send,msg)
end

function frmclose()
	os.exit()
end
 
