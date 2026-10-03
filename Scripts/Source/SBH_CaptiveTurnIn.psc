;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SBH_CaptiveTurnIn Extends TopicInfo Hidden

SBH_CaptiveFollowQuestScript Property QuestScript Auto
MiscObject Property Gold001 Auto

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE

int i = 0
int captiveCount = 0
int goldValue = MCM.GetModSettingInt("Surrender Bounty Hunter", "uCaptiveValue:Main")
ReferenceAlias[] SBH_CaptiveAliases = QuestScript.SBH_CaptiveAliases

while (i < SBH_CaptiveAliases.Length)
    Actor captive = SBH_CaptiveAliases[i].GetActorRef()
    if (captive && captive.GetAV("WaitingForPlayer") != 1)
        SBH_CaptiveAliases[i].RegisterForSingleUpdate(0.1)
        captiveCount += 1
    endif
    i += 1
endwhile

Game.GetPlayer().AddItem(Gold001, captiveCount * goldValue)

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
