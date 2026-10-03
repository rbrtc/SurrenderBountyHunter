Scriptname SBH_CaptiveOutfitEdit extends ActiveMagicEffect

ObjectReference Property SBH_CaptiveOutfitContainer Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    SBH_CaptiveOutfitContainer.Activate(akCaster)
endEvent