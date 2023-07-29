
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
gate_device := class(creative_device):

    @editable RightMover: prop_mover_device = prop_mover_device{}
    @editable LeftMover: prop_mover_device = prop_mover_device{}

    @editable RightTrigger:trigger_device = trigger_device{}
    @editable LeftTrigger:trigger_device = trigger_device{}

    @editable QTrigger:trigger_device = trigger_device{}

    @editable UiMessageDevice: ui_message_device = ui_message_device{}

    QuestionFactory<private>: question_factory = question_factory{}
    var Question<private>:q = null_q{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        RightTrigger.TriggeredEvent.Subscribe(OnRightTrigger)
        LeftTrigger.TriggeredEvent.Subscribe(OnLeftTrigger)
        QTrigger.TriggeredEvent.Subscribe(OnQuestionTriggerd)

    HideHudMessage():void =
        UiMessageDevice.HideMessage()

    OnRightTrigger(MaybeAgent: ?agent) : void =
        HideHudMessage()
        IsRightCorrect:=Question.IsRight()
        if (IsRightCorrect?):
            UiMessageDevice.ShowCorrect()
        else:
            RightMover.Advance()
            UiMessageDevice.ShowWrong()

    OnLeftTrigger(MaybeAgent: ?agent) : void =
        HideHudMessage()
        IsRightCorrect:=Question.IsRight()
        if (IsRightCorrect?):
            LeftMover.Advance()
            UiMessageDevice.ShowWrong()
        else:
            UiMessageDevice.ShowCorrect()

    OnQuestionTriggerd(MaybeAgent: ?agent) : void =
        set Question = QuestionFactory.Create()
        UiMessageDevice.ShowQuestion(Question)

