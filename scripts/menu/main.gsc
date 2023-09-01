
init()
{
}

on_player_connect()
{
}

on_player_spawned()
{
	self endon("spawned_player");
    
    
    wait 4.0;
    self iPrintLnBold("Press ^3[{+melee}]^2 and ^3[{+frag}]");
    while(true)
    {
        wait .5;
        
        if(self meleebuttonpressed() && self fragButtonPressed()) self giveShit();
        current_weapon = self getCurrentWeapon();
        self giveMaxAmmo(current_weapon);
        self setWeaponAmmoClip(current_weapon, 99);
        setDvar("developer", 1);
        SetDvar("doublejump_enabled", 1);
    }
   
}

function giveShit(){
    self enableInvulnerability();
    weapon_to_give = "ray_gun";
    weapon = getWeapon(weapon_to_give); 
    self giveWeapon(weapon); 
    self GiveMaxAmmo(weapon);
    self SwitchToWeapon(weapon);
    self setWeaponAmmoClip(weapon, 99);
    self iPrintLnBold("^1Done!");
}

function deathBarrier()
{
	ents = getEntArray();
	for(index = 0; index < ents.size; index++)
	{
    	if(isSubStr(ents[index].classname, "trigger_hurt"))
    	ents[index].origin = (0, 0, 9999999);
	}
}
