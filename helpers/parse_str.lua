---
-- 把字符串分割为数组。
-- @param pattern 模式串
-- @param str 要分割的字符串
-- @param plain 标记 pattern 是否为纯字符串。
-- @param isNumber 是否转换成数值

function string.explode(pattern, str, plain, isNumber)
	local ret = {};
	local i = 1;
	local len = #pattern;
	
	if (str == nil or str == "") then
		return ret;
	end
	
	repeat
		local j = string.find(str, pattern, i, plain);
		local value;
		if j then
			value = string.sub(str, i, j - 1);
			i = j + len;
		else
			value = string.sub(str, i);
		end
		if isNumber then
			value = tonumber(value);
		end
		table.insert(ret, value);
	until not j
	
	return ret;
end

---
-- 把字符串分割为数组。
-- @param pattern 模式串。默认为 ','
-- @param str 要分割的字符串
-- @param isNumber 是否转换成数值
-- @see explode

function string.split(str, pattern, isNumber)
	return string.explode(pattern or ',', str, true, isNumber);
end
