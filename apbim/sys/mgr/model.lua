_ENV = module(...,ap.adv)

local ZIP = require'sys.zip'
local STR = require'sys.str'
local ITEM = require'sys.Item'
local GROUP = require'sys.Group'
local MGR = require'sys.mgr'
local MGRDB = require'sys.mgr.db'
local MGRZIP = require'sys.mgr.zip'
local IFO = require'sys.mgr.ifo'

local md_ = nil;

--------------------------------------------------------

function init()
	md_ = nil;
	MGRZIP.init();
	MGRDB.init();
end

function get()
	if not GROUP.Class:is_class(md_) then md_ = GROUP.Class:new() end
	md_:ask_id();
	-- MGRDB.push_item(md_);
	return md_;
end

function set(md)
	if not GROUP.Class:is_class(md) then return end
	md_ = md;
end

function trace()
	local md = get();
	STR.totrace('model.mgrid = '..(md.mgrid or 'nil'));
	local ids = md:get_ids() or {};
	for k,v in pairs(ids) do
		STR.totrace(k..' = '..v);
	end
end

--------------------------------------------------------

-- function ask_id()
	-- get():ask_id();
-- end

-- function set_id(str)
	-- get():set_id(str);
-- end

-- function get_id()
	-- return get():get_id();
-- end

-- function set_name(str)
	-- get():set_name(str);
-- end

-- function get_name() 
	-- return get():get_name();
-- end

--------------------------------------------------------

function push_item(it)
	it = IFO.new(it);
	local id = MGRDB.push_item(it);
	if id==get():get_id() then set(it) else get():add_id(id); end
	return id;
end

function add_item(it)
	ITEM.Class.add(it);
	return push_item(it);
end

function del_item(it)
	ITEM.Class.del(it);
	return push_item(it);
end

--------------------------------------------------------

function get_item(k,v)
	local it = MGRDB.get_item(k,v);
	if ITEM.Class:is_class(it) and k==it:get_id() then MGRDB.set_item(it); return it; end
	
	it = MGRZIP.get_item(k); 
	if ITEM.Class:is_class(it) and k==it:get_id() then MGRDB.set_item(it); return it; end
	
	-- it = require'sys.mgr.version'.get_item(k,v); 
	-- if ITEM.Class:is_class(it) and k==it:get_id() then MGRDB.set_item(it); return it; end
	
	return nil;
end

-- t={update=true,gid=,hid=,cbf=}
function download_item(t)
	require'sys.mgr.version'.download_item{
		update = t.update;
		gid = t.gid;
		hid = t.hid;
		cbf = function(hid)
			if type(t.cbf)=='function' then t.cbf(hid) end
		end
	};
end

-- ts={gid=,hid=},endf=
-- function download_items(ts,endf)
	-- local n = 0;
	-- n = require'sys.table'.count(ts);
	-- for k,v in pairs(ts) do
		-- get_item{gid=v.gid,hid=v.hid,cbf=function() n=n-1 if n<=0 and type(endf)=='function' then endf() end end}
	-- end
-- end

--------------------------------------------------------

function get_all()
	return get():get_ids();
end

function get_undeleted()
	local its = {};
	local all = get():get_ids();
	local run = require"sys.progress".create{title="Calculating ... ",count=require"sys.table".count(all),time=0.1,update=false};
	for k,v in pairs(all) do
		local it = MGR.get_item(k,v);
		if not ITEM.Class.is_deleted(it) then 
			its[k] = it;
		end
		run();
	end
	return its;
end

function get_unsaved()
	local its = {};
	local all = get():get_ids();
	local run = require"sys.progress".create{title="Calculating ... ",count=require"sys.table".count(all),time=0.1,update=false};
	for k,v in pairs(all) do
		if not require"sys.mgr.db".is_item_saved(k) then 
			its[k] = v;
		end
		run();
	end
	return its;
end

--------------------------------------------------------

function open()
	local file = MGRZIP.get_file();
	if not file then return end
	local id = ZIP.read{zip=MGRZIP.get_file(),file=MGR.get_zip_model()..MGR.get_zip_index()..MGR.get_db_exname()};
	local md = MGRZIP.get_item(id);
	if GROUP.Class:is_class(md) then require'sys.mgr.model'.set(md) else get():set_id(id) end
end

function save()
	local file = MGRZIP.get_file();
	if not file then return end
	local ar = ZIP.open(file);
	if not ar then return end
	local md = require'sys.mgr.model'.get();
	md:ask_id();
	md:commit{};
	md:save{archive=ar};
	-- ZIP.add(ar,MGR.get_zip_model()..MGR.get_zip_index()..MGR.get_db_exname(),'string','return "'..MGR.get_model_id()..'"\n');
	local zip_model = MGR.get_zip_model()
	local zip_index = MGR.get_zip_index()
	local db_exname = MGR.get_db_exname()
	local text = 'return "'..md:get_id()..'"\n'
	-- local text = 'return "'..require'sys.mgr.version'.get_hid(MGR.get_model_id())..'"\n'
	ZIP.add(ar,zip_model..zip_index..db_exname,'string',text);
	ZIP.close(ar);
end

function commit()
	local md = require'sys.mgr.model'.get();
	md:ask_id();
	-- md:commit{};
	push_item(md);
end

function update()
	local gid = require'sys.mgr.model'.get():get_id();
	if not gid then return end;
	local hid = require'sys.mgr.version'.update_item(gid);
	if not hid then return end;
	local md = require'sys.io'.read_file{file=MGR.get_db_path()..hid..MGR.get_db_exname(),key=require"sys.mgr".get_db_key()};
	md = IFO.new(md);
	if not GROUP.Class:is_class(md) then return end
	md:ask_id();
	push_item(md);
end

-- arg=id/{id=,}
function upload(arg)
-- require'sys.table'.totrace{'mgr.model.upload()'}
	local id = type(arg)=='string' and arg or type(arg)=='table' and type(arg.id)=='string' and arg.id or nil;
	local it = id and require'sys.mgr.model'.get_item(id) or require'sys.mgr.model'.get();
-- require'sys.table'.totrace{'ask_id'}
	it:ask_id();
-- require'sys.table'.totrace{'commit'}
	it:commit{};
-- require'sys.table'.totrace{'upload'}
	it:upload{};
-- require'sys.table'.totrace{'upload start'}
end

-- t={gid=,hid=,open=true,update=true}
function download(t)
	local md = require'sys.mgr.model'.get();
	-- md:commit{};
	local gid = t.gid or md:get_id();
	local hid = t.hid;
	download_item{
		update = t.update;
		gid = gid;
		hid = hid;
		cbf = function(hid)
			if not hid then require'sys.cbf'.callf(t.cbf) return end
			local it = require'sys.io'.read_file{file=MGR.get_db_path()..hid..MGR.get_db_exname(),key=require"sys.mgr".get_db_key()}
			it = IFO.new(it);
			if GROUP.Class:is_class(it) then 
				if t.open then set(it) end
				it:download{update=t.update} 
			end
		end
	}
end


