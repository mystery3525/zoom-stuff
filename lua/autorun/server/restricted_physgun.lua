hook.Add( "PhysgunPickup", "ZoomPhysgunHook", function ( ply, ent, phys )
    if ent:GetClass() == "personal-spawn-pad" then
        return false
    end
end )
