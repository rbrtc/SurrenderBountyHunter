Scriptname SBH_CaptiveOutfitContainerScript extends ObjectReference  

FormList Property SBH_CaptiveOutfitFLST  Auto  
Armor Property ClothesPrisonerTunic Auto
Armor Property ClothesPrisonerShoes Auto
Armor Property PrisonerCuffsPlayer Auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    Armor outfitItem = akBaseItem as Armor
    if (outfitItem)
        SBH_CaptiveOutfitFLST.AddForm(outfitItem)
    else
        Debug.Notification("Only armor items are allowed")
        RemoveItem(akBaseItem, akOtherContainer = akSourceContainer)
    endif
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    SBH_CaptiveOutfitFLST.RemoveAddedForm(akBaseItem)
endEvent

Event OnInit()
    SBH_CaptiveOutfitFLST.AddForm(ClothesPrisonerTunic)
    SBH_CaptiveOutfitFLST.AddForm(ClothesPrisonerShoes)
    SBH_CaptiveOutfitFLST.AddForm(PrisonerCuffsPlayer)
endEvent