Scriptname SBH_CaptiveRef extends ReferenceAlias  

GlobalVariable Property SBH_CaptiveCount  Auto  
ObjectReference Property WIDeadBodyCleanupCellMarker  Auto  
Topic Property SBH_CaptiveGoodbyeTopic  Auto  

Function CleanUp(bool isTurningIn)
    if (isTurningIn)
        Debug.Trace("[SBH] A captive is being turned in to a guard")
    else
        Debug.Trace("[SBH] A captive has died")
        Debug.Notification("A captive has died")
    endif
    
    Clear()
    SBH_CaptiveCount.SetValue((SBH_CaptiveCount.GetValue() as int) - 1)
    Debug.Trace("[SBH] Captive count is now: " + SBH_CaptiveCount.GetValue() as int)
endFunction

Event OnUpdate()
    Actor captive = GetActorRef()
    if (!captive)
        return
    endif

    captive.SetDontMove()

    bool isSpeaking = Utility.RandomInt(0, 1)
    if (isSpeaking)
        ; Add some variance so they don't say the voice line at the same time
        float secondsToWait = Utility.RandomFloat(0.1, 1.5)
        Utility.Wait(secondsToWait)
        Debug.Trace("[SBH] A captive is saying the goodbye line")
        captive.Say(SBH_CaptiveGoodbyeTopic)
        ; Wait for them to finish speaking
        Utility.Wait(2)
    endif

    captive.SetAlpha(0.1, true)
    Utility.Wait(0.7)
    captive.SetAlpha(0.0)
    captive.RemoveAllItems()
    CleanUp(true)
    captive.Kill()
    captive.MoveTo(WIDeadBodyCleanupCellMarker)
endEvent

Event OnDeath(Actor akKiller)
    CleanUp(false)
endEvent

Event OnLoad()
    GetActorRef().IgnoreFriendlyHits()
    GetActorRef().SetRelationshipRank(Game.GetPlayer(), -3)
endEvent