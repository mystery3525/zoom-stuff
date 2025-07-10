hook.Add( "CanDrive", "AdjustDriveHook", function ( ply, ent )
    if ent:GetClass() == "personal-spawn-pad" then
        return false
    end
end )
