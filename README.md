# Surrender Bounty Hunter

This is a mod for Skyrim Special Edition that allows the player to capture enemies
and turn them into the guards for a reward. The Surrender mod allows enemies to
surrender to the player and this mod is a Surrender addon that adds the dialogue option
to capture them.

# Features

- Capture up to 5 enemies
- Captives will follow the player until they are turned in to a guard
- Earn a configurable gold reward for each captive turned in
- Captives may equip an optional captive outfit that can be edited in-game

# Requirements
[Surrender - Enemies Yield and Comply with Your Demands](https://www.nexusmods.com/skyrimspecialedition/mods/139522)

[MCM Helper](https://www.nexusmods.com/skyrimspecialedition/mods/53000)

## Optional Requirements:

[Bound hands - Helgen attack OAR or DAR animations - NPC Patch](https://www.nexusmods.com/skyrimspecialedition/mods/143622) -
Allows captives to be bound when equipped with prisoner cuffs instead of wearing
them like bracelets.

[Followers Don't Draw Weapons](https://www.nexusmods.com/skyrimspecialedition/mods/3870)
Or
[Nether's Follower Framework](https://www.nexusmods.com/skyrimspecialedition/mods/55653)
(Follower Outift & Gear -> Disable Weapon Draw) -
Stops captives from unsheathing their weapons/hands when the player does. Keep in mind these mods apply to all followers.

[Follower Equip Control](https://www.nexusmods.com/skyrimspecialedition/mods/175124) -
Stops captives from reequipping their default outfit when the captive outfit is applied.

[Spell Perk Item Distributor (SPID)](https://www.nexusmods.com/skyrimspecialedition/mods/36869) - For the No Player Damage optional file.

# Optional Files

SBH No Player Damage_DISTR.ini - An SPID distribution file that makes the captives
immune from damage from the player.

SBH No Idle Chatter.esp - Stops the captives from saying random voice lines during travel.

SBH Vanilla Dialogue Options.esp - Changes the dialogue options when capturing
and turning in captives to make it compatible with preexisting DBVO voice packs.

Included Changes:

You're coming with me. -> Follow me.

I am turning in this criminal./I am turning in these criminals. ->
Would I be able to collect a bounty?

I left this a separate file because I felt the original options were more contextually and grammatically appropriate.

# Building the ESP

[Spriggit](https://github.com/Mutagen-Modding/Spriggit) is required to build the esp from the JSON files.
Simply point Spriggit to the particular ESP that you want to build in the ESP
directory and click the `Sync to Mod` button.

# Known Issues:

Captive quest waiting markers cannot be toggled individually.
