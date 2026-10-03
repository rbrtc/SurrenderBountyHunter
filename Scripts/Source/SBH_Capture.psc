;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SBH_Capture Extends TopicInfo Hidden

GlobalVariable Property SBH_CaptiveCount  Auto  
Spell Property SurrenderAura  Auto  
SBH_CaptiveFollowQuestScript Property QuestScript Auto
ObjectReference Property SBH_CaptiveContainer Auto
FormList Property SBH_MaleCaptiveOutfitFLST  Auto  
FormList Property SBH_FemaleCaptiveOutfitFLST  Auto  

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.DispelSpell(SurrenderAura)
akSpeaker.StopCombatAlarm()
akSpeaker.SetAV("Confidence", 0)
akSpeaker.SetAV("Morality", 0)
akSpeaker.SetAV("Aggression", 0)
akSpeaker.SetPlayerTeammate()
akSpeaker.IgnoreFriendlyHits()
akSpeaker.SetRelationshipRank(Game.GetPlayer(), -3)

; Unequips spells (if any) because the player can't unequip them from an NPC 

; Left hand
Spell spellToUnequip = akSpeaker.GetEquippedSpell(0)
if (spellToUnequip)
    akSpeaker.UnequipSpell(spellToUnequip, 0)
endif

; Right hand
spellToUnequip = akSpeaker.GetEquippedSpell(1)
if (spellToUnequip)
    akSpeaker.UnequipSpell(spellToUnequip, 1)
endif

bool filled = false
bool maleOutfitOption = MCM.GetModSettingBool("Surrender Bounty Hunter", "bEnableMaleOutfit:Main")
bool femaleOutfitOption = MCM.GetModSettingBool("Surrender Bounty Hunter", "bEnableFemaleOutfit:Main") 
int i = 0
int actorSex = akSpeaker.GetLeveledActorBase().GetSex()
ReferenceAlias[] captiveAliases = QuestScript.SBH_CaptiveAliases

while (!filled && (i < captiveAliases.Length))
    if (captiveAliases[i].ForceRefIfEmpty(akSpeaker))
        filled = true
        Debug.Trace("[SBH] Filled alias " + (i + 1))
    endif
    i += 1
endwhile

if ((maleOutfitOption && actorSex == 0) || (femaleOutfitOption && actorSex == 1))
    FormList outfitFLST

    if (femaleOutfitOption && actorSex == 1)
        outfitFLST = SBH_FemaleCaptiveOutfitFLST
    else
        outfitFLST = SBH_MaleCaptiveOutfitFLST
    endif

    akSpeaker.RemoveAllItems(SBH_CaptiveContainer)
    akSpeaker.AddItem(outfitFLST)
    SBH_CaptiveContainer.RemoveAllItems(akSpeaker)
    akSpeaker.UnequipAll()
    
    i = 0
    int listSize = outfitFLST.GetSize()

    while (i < listSize)
        Form outfitItem = outfitFLST.GetAt(i)
        if (outfitItem && (outfitItem as Armor))
            akSpeaker.EquipItem(outfitItem, true)
        endif
        i+= 1
    endwhile
endif

SBH_CaptiveCount.SetValue(SBH_CaptiveCount.GetValueInt() + 1)
Debug.Trace("[SBH] The captive count is now: " + (SBH_CaptiveCount.GetValue() as int))

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment