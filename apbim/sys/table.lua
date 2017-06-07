_ENV = module(...,ap.adv)function tostr(src)	return require"sys.api.table".tostr(src);end-- arg={file=,key=,src=}function tofile(arg)	require"sys.api.table".tofile(arg);endfunction totrace(arg)	require"sys.api.table".totrace(arg);endfunction deepcopy(src)	return require"sys.api.table".deepcopy(src);endfunction count(t)	return require"sys.api.table".count(t);endfunction reverse_array(ary)	local n = count(ary);	for i=1, n/2 do		local tmp = ary[i];		ary[i] = ary[n-i+1]		ary[n-i+1] = tmp;	end	return ary;end-- f = function(k,v,s) return v.x..v.y endfunction index(t,f)	if type(t)~="table" then return {} end	if type(f)~="function" then return {} end	local s = {};	for k,v in pairs(t) do		local dx = f(k,v,t);		if dx then 			s[dx] = k 		end	end	return s;endfunction get_value(src,new,key)	return new[key] and src[new[key]];end-- f(arg),arg={k1=,k2=,v1=,v2=,t}-- f(k1,k2,t)-- f(k1,k2)function sortk(t,f)	if type(t)~="table" then return {} end	local s = {};	for k,v in pairs(t) do		table.insert(s,k);	end	-- local _f = type(f)=="function" and function(k1,k2) return f{k1=k1,k2=k2,v1=t[k1],v2=t[k2],t=t} end	-- local _f = type(f)=="function" and function(k1,k2) return f(k1,k2,t) end	table.sort(s,f);	return s;endfunction sortv(t,f)	if type(t)~="table" then return {} end	local s = {};	for k,v in pairs(t) do		table.insert(s,k);	end	local _f = type(f)=="function" and function(a,b) return (f(a) or 0)<(f(b) or 0) end	table.sort(s,_f);	return s;endfunction filter(t,f)	if type(t)~="table" then return {} end	if type(f)~="function" then return {} end	local s = {};	for k,v in pairs(t) do		if f(k,v,t) then s[k]=v end	end	return s;end-- t={dat=,file=,key=,ret=}function save(t)	-- require"app.Contacts.File.file_op".save_table_to_file(t.file,t.src);	require"sys.api.code".save{data=t.dat or t.src,file=t.file,key=t.key,returnKey=t.ret};end