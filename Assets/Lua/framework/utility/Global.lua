
function Log(info)
	if type(info) == "table" then
		info = dumpTable(info)
	end
	CS.GameLog.Log(string.format("[%s]%s\n%s",Time.frameCount, info, debug.traceback()))
end

function LogError(info)
	if type(info) == "table" then
		info = dumpTable(info)
	end
	CS.GameLog.LogError(string.format("[%s]%s\n%s",Time.frameCount, info, debug.traceback()))
end

function LogWarning(info)
	if type(info) == "table" then
		info = dumpTable(info)
	end
	CS.GameLog.LogWarning(string.format("[%s]%s\n%s",Time.frameCount, info, debug.traceback()))
end

function dumpTable(value, desciption, nesting)
    if type(nesting) ~= "number" then nesting = 3 end
 
    local lookupTable = {}
    local result = {}
 
    local function _v(v)
        if type(v) == "string" then
            v = "\"" .. v .. "\""
        end
        return tostring(v)
    end
 
    local function _dump(value, desciption, indent, nest, keylen)
        desciption = desciption or "<var>"
        local spc = ""
        if type(keylen) == "number" then
            spc = string.rep(" ", keylen - string.len(_v(desciption)))
        end
        if type(value) ~= "table" then
            result[#result +1 ] = string.format("%s%s%s = %s", indent, _v(desciption), spc, _v(value))
        elseif lookupTable[value] then
            result[#result +1 ] = string.format("%s%s%s = *REF*", indent, desciption, spc)
        else
            lookupTable[value] = true
            if nest > nesting then
                result[#result +1 ] = string.format("%s%s = *MAX NESTING*", indent, desciption)
            else
                result[#result +1 ] = string.format("%s%s = {", indent, _v(desciption))
                local indent2 = indent.."    "
                local keys = {}
                local keylen = 0
                local values = {}
                for k, v in pairs(value) do
                    keys[#keys + 1] = k
                    local vk = _v(k)
                    local vkl = string.len(vk)
                    if vkl > keylen then keylen = vkl end
                    values[k] = v
                end
                table.sort(keys, function(a, b)
                    if type(a) == "number" and type(b) == "number" then
                        return a < b
                    else
                        return tostring(a) < tostring(b)
                    end
                end)
                for i, k in ipairs(keys) do
                    _dump(values[k], k, indent2, nest + 1, keylen)
                end
                result[#result +1] = string.format("%s}", indent)
            end
        end
    end
    _dump(value, desciption, "- ", 1)
 
	local resultStr = ""
    for i, line in ipairs(result) do
        resultStr = resultStr .. line.."\n"
	end
	return resultStr
end

function clone( object )
    local lookup_table = {}
    local function copyObj( object )
        if type( object ) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
       
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs( object ) do
            new_table[copyObj( key )] = copyObj( value )
        end
        return setmetatable( new_table, getmetatable( object ) )
    end
    return copyObj( object )
end

function clampVectorY(vec, y)
    y = y or 0
    return Vector3(vec.x, y, vec.z) 
end

function clampFixedVectorY(vec, y)
    y = y or 0
    return FixedVector3(vec.x, y, vec.z) 
end

function checkVectorEqual(vec1, vec2)
    return vec1.x==vec2.x and vec1.y==vec2.y and vec1.z==vec2.z
end

function makeVectorEqual(vec1, vec2)
    if not checkVectorEqual(vec1, vec2) then
        vec1.x = vec2.x
        vec1.y = vec2.y
        vec1.z = vec2.z
        return false
    end
    return true
end

function getVerticalVector(vec)
    if vec.z == 0 then
        return Vector3(0, 0, -1)
    else
        return Vector3(-vec.z / vec.x, 0, 1).normalized
    end
end

function arrayContain(array, item)
    for i,v in ipairs(array) do
        if v==item then
            return true
        end
    end
    return false
end

function handler(func, self)
    return function(...)  
        if not func then return end
        return func(self, ...) 
    end
end

function isInRange(tar, min, max)
    return tar>=min and tar<=max
end

function compareValue(val, tarVal, tp)
    if tp == 0 then
        return val < tarVal
    elseif tp == 1 then
        return val > tarVal
    elseif tp == 2 then
        return val == tarVal
    end
    return false
end

function StartDelayTask(func,time)
    return coroutine.start(function()
                coroutine.wait(time)
                func()
            end)
end

function StopDelayTask(task)
    coroutine.stop(task)
end


--
function ToVector3(position)
    return Vector3(position.x,position.y,position.z)
end

function ToEuler(rotation)
    return Quaternion.Euler(0,rotation.y,0)
end

-- function Vector3VagueEqual(vec1, vec2)
--     return vec1 = vec1
-- end

function MinOffset(p1 ,p2)
    if p1:SqrMagnitude() <= p2:SqrMagnitude() then
        return p1 , true 
    end
    return p2 ,false
end

function FixedVector2(x,y)
    return FixedVector3(x,y,0)
end

function math.clamp(val, min, max)
    if min and val < min then val = min end
    if max and val > max then val = max end
    return val
end

function string.startWith(content, target)
    local index = string.find(content, target)
    return index == 1
end

function string.split(input, delimiter)
    input = tostring(input)
    delimiter = tostring(delimiter)
    if (delimiter=='') then return false end
    local pos,arr = 0, {}
    -- for each divider found
    for st,sp in function() return string.find(input, delimiter, pos, true) end do
        table.insert(arr, string.sub(input, pos, st - 1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(input, pos))
    return arr
end
