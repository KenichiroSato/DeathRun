
using { /Verse.org/Random }

question := class:
    Num1 : int
    Num2 : int
    LeftOption : int
    RightOption : int

    IsRight(): logic =
        if(Num1 * Num2 = RightOption):
            true
        else:
            false

    QuestionText(): string = "{Num1} × {Num2}"
        
    NextQuestion(): question =
        LeftVal: int = GetRandomInt(1, 19)
        RightVal: int = GetRandomInt(1, 19)
        Correct: int = LeftVal * RightVal
        var Wrong: int = -1
        loop:
            set Wrong = Correct + GetRandomInt(-5, 5)
            if (not Wrong = Correct and Wrong > 0):
                break
        Options: []int = Shuffle(array {Correct, Wrong})

        var NewQ: question = question{Num1 := 1, Num2:= 1, LeftOption:= 1, RightOption:= 2}
        if (Left:int = Options[0]):
            if(Right:int = Options[1]):
                set NewQ = question{Num1 := LeftVal, Num2:= RightVal, LeftOption:= Left, RightOption:= Right}
        return NewQ

