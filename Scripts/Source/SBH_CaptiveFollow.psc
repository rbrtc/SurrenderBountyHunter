;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SBH_CaptiveFollow Extends TopicInfo Hidden

SBH_CaptiveFollowQuestScript Property QuestScript Auto

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.SetAv("WaitingForPlayer", 0)

int i = 0
ReferenceAlias[] captiveAliases = QuestScript.SBH_CaptiveAliases

while (i < captiveAliases.Length)
    Actor captive = captiveAliases[i].GetActorRef()
    if (captive == akSpeaker)
        Debug.Trace("[SBH] Hiding objective for captive " + (i + 1))
        GetOwningQuest().SetObjectiveDisplayed(i, false)
    endif
    i += 1
endwhile

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment