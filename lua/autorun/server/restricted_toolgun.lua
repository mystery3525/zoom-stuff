hook.Add("CanTool", "ZoomToolgunHook", function ( ply, tr, toolname, tool, button )
    if toolname != "unbreakable" then
        return -- ignore all other tools
    end

    if not IsValid(tr.Entity) then
        return -- Ignore invalid entities
    end

    if tr.Entity:GetClass() != "personal-spawn-pad" then
        return -- Ignore everything but the spawn pads
    end

    return false -- block the toolgun attempt
end)
