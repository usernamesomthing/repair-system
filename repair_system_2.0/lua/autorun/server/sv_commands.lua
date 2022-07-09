util.AddNetworkString("vc1") -- pools the net message making it a thing
util.AddNetworkString("vc2")
util.AddNetworkString("vc3")
util.AddNetworkString("vc4")
util.AddNetworkString("vc5")
util.AddNetworkString("vc6")
util.AddNetworkString("vc7")
util.AddNetworkString("vc8")
util.AddNetworkString("vc9")
util.AddNetworkString("vc10")
util.AddNetworkString("vc11")
util.AddNetworkString("vc12")
util.AddNetworkString("vc13")
util.AddNetworkString("vc14")



hook.Add( "PlayerSay", "vc1", function( ply, text ) -- function
	local team_allowed = ply:Team()
        if team_allowed == TEAM_049  then
	if ( string.lower( text ) == "/vc1" ) then -- command
    net.Start("vc1") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
		return ""
	end


        if ( string.lower( text ) == "/vc2" ) then -- command
    net.Start("vc2") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc3" ) then -- command
    net.Start("vc3") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc4" ) then -- command
    net.Start("vc4") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc5" ) then -- command
    net.Start("vc5") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc6" ) then -- command
    net.Start("vc6") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc7" ) then -- command
    net.Start("vc7") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc8" ) then -- command
    net.Start("vc8") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc9" ) then -- command
    net.Start("vc9") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc10" ) then -- command
    net.Start("vc10") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc11" ) then -- command
    net.Start("vc11") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc12" ) then -- command
    net.Start("vc12") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc13" ) then -- command
    net.Start("vc13") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

        if ( string.lower( text ) == "/vc14" ) then -- command
    net.Start("vc14") -- sends to client to run the sound
    net.Send(ply) -- sends to all players
        return ""
    end

end
 if ply:GetUserGroup() == "Moderator" or ply:GetUserGroup() == "Administrator" or ply:GetUserGroup() == "Senioradmin" or ply:GetUserGroup() == "Superadmin" or ply:GetUserGroup() == "Owner" then
        if ( string.lower( text ) == "/breach" ) then -- command
        breach()
        return ""
    end
end
end ) 


function breach() -- function
for k, door in pairs( ents.GetAll() ) do  -- look at every entity on the map

if door:GetClass() ==  "func_door" then -- if the entity is this entity ( door ) then
    door:Fire("open") -- close door
end
end
end