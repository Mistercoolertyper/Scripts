--< engo's implementation of filtergc into syn v2/other exploits. >--

local is_synapse_function = is_synapse_function or function() return false end

print("updated")

local function table_find(t, v)
    for _, val in next, t do 
        if val == v then 
            return val   
        end    
    end    
end

local Checks = {
    ['function'] = function(Obj, Data) 
        local Name, Constants, Upvalues, IgnoreSyn = (Data.Name), (Data.Constants or {}), (Data.Upvalues or {}), (Data.IgnoreSyn == nil) and true or false
        local ObjName, ObjConstants, ObjUpvalues, ObjIsSyn = (debug.getinfo(Obj).name), (islclosure(Obj) and debug.getconstants(Obj) or {}), (debug.getupvalues(Obj) or {}), (is_synapse_function(Obj))
   
        if IgnoreSyn and ObjIsSyn then 
            return false    
        end
        
        if Name and ObjName and Name ~= ObjName then 
            return false    
        end
        
        for i, v in next, Constants do 
            if not table_find(ObjConstants, v) then 
                return false    
            end  
        end
        
        for i, v in next, Upvalues do 
            if not table_find(ObjUpvalues, v) then 
                return false    
            end  
        end
        
        return true
    end,
    ['table'] = function(Obj, Data) 
        local Keys, Values, KeyValuePairs, Metatable = (Data.Keys or {}), (Data.Values or {}), (Data.KeyValuePairs or {}), (Data.Metatable or {})
        
        local ObjMetatable = getrawmetatable(Obj)
        if ObjMetatable then 
            for i, v in next, ObjMetatable do 
                if (Metatable[i] ~= v) then 
                    return false
                end    
            end    
        end
        
        for i, v in next, Keys do
            if not Obj[v] then 
                return false
            end    
        end
        
        for i, v in next, Values do 
            if not table_find(Obj, v) then 
                return false    
            end    
        end
        
        for i, v in next, KeyValuePairs do 
            local Other = Obj[i]    
            if Other ~= v then 
                return false    
            end
        end
        
        return true
    end,
}

local filtergc = function(Type, Data, One) 
    local Results = {}
    for i,v in next, getgc(true) do 
        if type(v) == Type then 
            if Checks[Type](v, Data) then 
                if One then 
                    return v    
                end
                table.insert(Results, v)
            end    
        end
    end
    return Results
end
return filtergc
