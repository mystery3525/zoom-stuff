local function getSwepClass(dmginfo)
    local swep = dmginfo:GetWeapon()
    if not IsValid(swep) then
        swep = dmginfo:GetAttacker():GetActiveWeapon()
    end -- sometimes it doesn't get it right it the first time

    if IsValid(swep) then
        return swep:GetClass()
    end
    
    return "nil"
end

hook.Add( "EntityTakeDamage", "NoRPGAgainstInfantry", function( target, dmginfo )
    if not dmginfo:IsExplosionDamage() then
        return -- first, ignore all non-blast damage. This is the most common indicator so its more efficient to do it first
    end

    local attacker = dmginfo:GetAttacker()
    local swep_class = getSwepClass( dmginfo )
    if not (swep_class == "weapon_rpg" or swep_class == "rpg-7" or swep_class == "glide_homing_launcher" or swep_class == "arc9_uplp_signalis_flaregun") then
        if not (swep_class == "nil" and attacker:Health() > 0) then
            return -- ignore any explosive damage from weapons not listed here
        end -- we ignore this situation if we can't find the weapon and the attacker is dead (health <= 0) because people can just suicide the rpg. I don't think dead people should be doing max explosion damage anyways.
    end

    if target == attacker then
        return -- we should do nothing trololo
    end
    
    local set_dmg = dmginfo:GetDamage()
    if target:IsPlayer() or target:IsNPC() then
        set_dmg = math.Clamp( set_dmg, 0, 10 ) -- hard-cap to 10 damage
    end

    -- Set the damage
    dmginfo:SetDamage( set_dmg )
end )
