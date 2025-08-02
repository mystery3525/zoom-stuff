local FALLBACK_MAP = "gm_flatgrass"

hook.Add( "PostGamemodeLoaded", "set_default_map", function()
    timer.Simple(30, function()
        local NEXTLEVEL = GetConVar( "rep_nextlevel" )
        local current_default = NEXTLEVEL:GetString()
        local current_map = game.GetMap()
        print( "[defaultmap] Setting default map to '".. current_map .."' (was '".. current_default .."')" )

        if current_default == current_map then
            return
        end

        local good, _ = pcall(RunConsoleCommand, "rep_nextlevel", current_map )
        if not good then
            RunConsoleCommand( "rep_nextlevel", FALLBACK_MAP )
        end
        print( "[defaultmap] success" )
    end )
end )
