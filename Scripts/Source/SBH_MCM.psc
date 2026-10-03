Scriptname SBH_MCM extends MCM_ConfigBase

GlobalVariable Property SBH_DisableFollowerDialogue  Auto  

Event OnConfigInit()
    SBH_DisableFollowerDialogue.SetValue(GetModSettingBool("bDisableFollowerDialogue:Main") as float)
endEvent

Event OnSettingChange(string a_ID)
    if(a_ID == "bDisableFollowerDialogue:Main")
        SBH_DisableFollowerDialogue.SetValue(GetModSettingBool("bDisableFollowerDialogue:Main") as float)
    endif
EndEvent