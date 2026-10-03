Scriptname SBH_CaptiveFollowQuestScript extends Quest  

ReferenceAlias[] Property SBH_CaptiveAliases  Auto  
Spell Property SBH_MaleCaptiveOutfitEdit  Auto  
Spell Property SBH_FemaleCaptiveOutfitEdit  Auto  

Event OnInit()
    Actor player = Game.GetPlayer()
    player.AddSpell(SBH_MaleCaptiveOutfitEdit, false)
    player.AddSpell(SBH_FemaleCaptiveOutfitEdit, false)
endEvent