using { /Verse.org/Random }

question_factory := class():
    Create(): q = MakeMultiprecationQ()

MakeMultiprecationQ<constructor>() := multiplication_q:
    let:
        LeftVal: int = GetRandomInt(1, 19)
        RightVal: int = GetRandomInt(1, 19)
        Correct: int = LeftVal * RightVal
        var Wrong: int = -1
    block:
        loop:
            set Wrong = Correct + GetRandomInt(-5, 5)
            if (not Wrong = Correct and Wrong > 0):
                break

    Num1 := LeftVal
    Num2 := RightVal
    LeftOption := Correct
    RightOption := Wrong