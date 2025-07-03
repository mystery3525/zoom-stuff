local CATEGORY_NAME = "Menus"

if ULib.fileExists( "lua/ulx/modules/cl/motdmenu.lua" ) or ulx.motdmenu_exists then

    ------------------------------ Force MOTD ------------------------------
    function ulx.fmotd( calling_ply, target_plys )
        if GetConVarString( "ulx_showMotd" ) == "0" then
            calling_ply:ChatPrint( "[ERROR]: The MOTD has been disabled on this server." )
            return
        end

        if GetConVarString( "ulx_showMotd" ) == "1" and not ULib.fileExists( GetConVarString( "ulx_motdfile" ) ) then
            calling_ply:ChatPrint( "[ERROR]: The MOTD is enabled but we can't find the motd file!" )
            return
        end

        if ulx.motd then
            for _, v in pairs( target_plys ) do
                ulx.motd( v )
            end
        else
            for _, v in pairs( target_plys ) do
                v:ConCommand( "ulx motd" )
            end
        end

        ulx.fancyLogAdmin( calling_ply, "#A forced #T read the motd.", target_plys )
    end

    local fmotd = ulx.command( CATEGORY_NAME, "ulx fmotd", ulx.fmotd, "!fmotd" )
    fmotd:addParam{ type=ULib.cmds.PlayersArg }
    fmotd:defaultAccess( ULib.ACCESS_ADMIN )
    fmotd:help( "Forces the target(s) to read the motd." )
end
