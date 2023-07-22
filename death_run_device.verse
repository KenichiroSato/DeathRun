
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
death_run_device := class(creative_device):

    @editable RightMover1: prop_mover_device = prop_mover_device{}
    @editable LeftMover1: prop_mover_device = prop_mover_device{}
    @editable RightMover2: prop_mover_device = prop_mover_device{}
    @editable LeftMover2: prop_mover_device = prop_mover_device{}
    @editable RightMover3: prop_mover_device = prop_mover_device{}
    @editable LeftMover3: prop_mover_device = prop_mover_device{}
    @editable RightMover4: prop_mover_device = prop_mover_device{}
    @editable LeftMover4: prop_mover_device = prop_mover_device{}
    @editable RightMover5: prop_mover_device = prop_mover_device{}
    @editable LeftMover5: prop_mover_device = prop_mover_device{}
    @editable RightMover6: prop_mover_device = prop_mover_device{}
    @editable LeftMover6: prop_mover_device = prop_mover_device{}
    @editable RightMover7: prop_mover_device = prop_mover_device{}
    @editable LeftMover7: prop_mover_device = prop_mover_device{}
    @editable RightMover8: prop_mover_device = prop_mover_device{}
    @editable LeftMover8: prop_mover_device = prop_mover_device{}
    @editable RightMover9: prop_mover_device = prop_mover_device{}
    @editable LeftMover9: prop_mover_device = prop_mover_device{}
    @editable RightMover10: prop_mover_device = prop_mover_device{}
    @editable LeftMover10: prop_mover_device = prop_mover_device{}

    @editable RightTrigger1:trigger_device = trigger_device{}
    @editable LeftTrigger1:trigger_device = trigger_device{}
    @editable RightTrigger2:trigger_device = trigger_device{}
    @editable LeftTrigger2:trigger_device = trigger_device{}
    @editable RightTrigger3:trigger_device = trigger_device{}
    @editable LeftTrigger3:trigger_device = trigger_device{}
    @editable RightTrigger4:trigger_device = trigger_device{}
    @editable LeftTrigger4:trigger_device = trigger_device{}
    @editable RightTrigger5:trigger_device = trigger_device{}
    @editable LeftTrigger5:trigger_device = trigger_device{}
    @editable RightTrigger6:trigger_device = trigger_device{}
    @editable LeftTrigger6:trigger_device = trigger_device{}
    @editable RightTrigger7:trigger_device = trigger_device{}
    @editable LeftTrigger7:trigger_device = trigger_device{}
    @editable RightTrigger8:trigger_device = trigger_device{}
    @editable LeftTrigger8:trigger_device = trigger_device{}
    @editable RightTrigger9:trigger_device = trigger_device{}
    @editable LeftTrigger9:trigger_device = trigger_device{}
    @editable RightTrigger10:trigger_device = trigger_device{}
    @editable LeftTrigger10:trigger_device = trigger_device{}

    @editable QTrigger1:trigger_device = trigger_device{}
    @editable QTrigger2:trigger_device = trigger_device{}
    @editable QTrigger3:trigger_device = trigger_device{}
    @editable QTrigger4:trigger_device = trigger_device{}
    @editable QTrigger5:trigger_device = trigger_device{}
    @editable QTrigger6:trigger_device = trigger_device{}
    @editable QTrigger7:trigger_device = trigger_device{}
    @editable QTrigger8:trigger_device = trigger_device{}
    @editable QTrigger9:trigger_device = trigger_device{}
    @editable QTrigger10:trigger_device = trigger_device{}

    var RightMoverList:[]prop_mover_device = array {}
    var LeftMoverList:[]prop_mover_device = array {}
    var RightTriggerList:[]trigger_device = array {}
    var LeftTriggerList:[]trigger_device = array {}
    var QuestionTriggerList:[]trigger_device = array {}


    @editable HudQuestion1 : hud_message_device = hud_message_device{}
    @editable HudRight : hud_message_device = hud_message_device{}
    @editable HudLeft : hud_message_device = hud_message_device{}

    QuestionFactory<private>: question_factory = question_factory{}
    var Question<private>:q = null_q{}
    
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        # TODO: Replace this with your code
        Print("Hello, world!")
        Print("2 + 2 = {2 + 2}")
        set RightMoverList = array { RightMover1, RightMover2, RightMover3, RightMover4, RightMover5, RightMover6, RightMover7, RightMover8, RightMover9, RightMover10 }
        set LeftMoverList = array { LeftMover1, LeftMover2, LeftMover3, LeftMover4, LeftMover5, LeftMover6, LeftMover7, LeftMover8, LeftMover9, LeftMover10 }
        set RightTriggerList = array {RightTrigger1, RightTrigger2, RightTrigger3, RightTrigger4, RightTrigger5, RightTrigger6, RightTrigger7, RightTrigger8, RightTrigger9, RightTrigger10}
        set LeftTriggerList = array {LeftTrigger1, LeftTrigger2, LeftTrigger3, LeftTrigger4, LeftTrigger5, LeftTrigger6, LeftTrigger7, LeftTrigger8, LeftTrigger9, LeftTrigger10}
        set QuestionTriggerList = array {QTrigger1, QTrigger2, QTrigger3, QTrigger4, QTrigger5, QTrigger6, QTrigger7, QTrigger8, QTrigger9, QTrigger10}
        SetGateTrigger()
        SetQuestionTrigger()
        Print("rightMoverLength= {RightMoverList.Length},  leftMoverLength= {LeftMoverList.Length}")


    SetQuestionTrigger():void =
        for (Index := 0..QuestionTriggerList.Length - 1):
            if (Element := QuestionTriggerList[Index]):
                Element.TriggeredEvent.Subscribe(OnQuestionTriggerd)

    SetGateTrigger():void =
        for (Index := 0..RightTriggerList.Length - 1):
            if (Element := RightTriggerList[Index]):
                Element.TriggeredEvent.Subscribe(OnRightTrigger)      
        for (Index := 0..LeftTriggerList.Length - 1):
            if (Element := LeftTriggerList[Index]):
                Element.TriggeredEvent.Subscribe(OnLeftTrigger)

    HideHudMessage():void =
        HudQuestion1.Hide()
        HudLeft.Hide()
        HudRight.Hide()

    OnRightTrigger(MaybeAgent: ?agent) : void =
        HideHudMessage()
        IsRightCorrect:=Question.IsRight()
        if (not IsRightCorrect?):
            CloseGate(RightMoverList)

    OnLeftTrigger(MaybeAgent: ?agent) : void =
        HideHudMessage()
        IsRightCorrect:=Question.IsRight()
        if (IsRightCorrect?):
            CloseGate(LeftMoverList)

    CloseGate(list: []prop_mover_device): void =
        for (Index := 0..list.Length - 1):
            if (Element := list[Index]):
                Element.Advance()

    OnQuestionTriggerd(MaybeAgent: ?agent) : void =
        SetQuestion()

    ShowMessage(Device: hud_message_device, Message: string) : void =
        Device.Hide()
        Device.SetText(StringToMessage(Message))
        Device.Show()

    StringToMessage<localizes>(value:string) : message = "{value}"

    SetQuestion():void =
        set Question = QuestionFactory.Create()
        ShowMessage(HudQuestion1, Question.Text())
        ShowMessage(HudLeft, "{Question.LeftText()} 👈")
        ShowMessage(HudRight, "👉 {Question.RightText()}")

