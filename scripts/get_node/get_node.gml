function get_node(_id)
{
    switch(_id)
    {

        // INTRO
        case 0:
            return {
                text: "Hey… I’ve seen you around class quite a bit.",
                next: 1
            };

        case 1:
            return {
                text: "My name is Jasda. What’s yours?",
                input: true,
                next: 2
            };

        case 2:
            return {
                text: "Nice to meet you, " + player_name + ".",
                next: 3
            };

        case 3:
            return {
                text: "So tell me… what brings you here?",
                choices: [
                    { text: "Studying, duh.", next: 10, aff: -1 },
                    { text: "Not really sure.", next: 20, aff: 0 },
                    { text: "To see you.", next: 30, aff: 2 },
                    { text: "...", next: 40, aff: -2 }
                ]
            };

        // ROUTE 1 – Slightly rude
        case 10:
            return {
                text: "Wow. Straight to the point.",
                next: 11
            };

        case 11:
            if (affection < 0)
            {
                return {
                    text: "You’re kind of blunt… I respect it. A little.",
                    next: 12
                };
            }
            else
            {
                return {
                    text: "Confident, huh?",
                    next: 12
                };
            }

        case 12:
            return {
                text: "Are you always like this?",
                choices: [
                    { text: "Only on Tuesdays.", next: 50, aff: 1 },
                    { text: "Pretty much.", next: 51, aff: -1 }
                ]
            };

        // ROUTE 2 – Neutral
        case 20:
            return {
                text: "That’s honest… I appreciate that.",
                next: 21
            };

        case 21:
            return {
                text: "Do you overthink things a lot?",
                choices: [
                    { text: "Constantly.", next: 52, aff: 1 },
                    { text: "Not really.", next: 53, aff: 0 }
                ]
            };

        // ROUTE 3 – Flirty
        case 30:
            if (affection < 3)
            {
                return {
                    text: "Oh? That’s bold of you to say so early.",
                    next: 31
                };
            }
            else
            {
                return {
                    text: "You’re getting smoother, " + player_name + ".",
                    next: 31
                };
            }

        case 31:
            return {
                text: "Are you always this confident?",
                choices: [
                    { text: "Only when it matters.", next: 54, aff: 2 },
                    { text: "I'm actually nervous.", next: 55, aff: 1 }
                ]
            };

        // ROUTE 4 – Awkward silence
        case 40:
            return {
                text: "...Are you okay?",
                next: 41
            };

        case 41:
            return {
                text: "You don’t have to force it. Just talk to me.",
                next: 42
            };

        case 42:
            return {
                text: "Try again. Why are you here?",
                choices: [
                    { text: "Sorry. I get nervous.", next: 55, aff: 1 },
                    { text: "Forget it.", next: 900, aff: -3 }
                ]
            };

        // MID GAME PATHS

        case 50:
            return {
                text: "That was actually funny.",
                next: 60
            };

        case 51:
            return {
                text: "Hmm. I’ll keep that in mind.",
                next: 60
            };

        case 52:
            return {
                text: "Same… it’s exhausting sometimes.",
                next: 60
            };

        case 53:
            return {
                text: "Must be nice.",
                next: 60
            };

        case 54:
            return {
                text: "Dangerous answer.",
                next: 60
            };

        case 55:
            return {
                text: "That’s kind of cute, actually.",
                next: 60
            };

        // CORE RELATIONSHIP CHECKPOINT

        case 60:
            if (affection >= 5)
            {
                return {
                    text: "You know… I’m glad you came over today.",
                    next: 70
                };
            }
            else if (affection <= -3)
            {
                return {
                    text: "I’m not really sure we’re on the same wavelength.",
                    next: 80
                };
            }
            else
            {
                return {
                    text: "So… what do you think of me so far?",
                    input: true,
                    next: 65
                };
            }

        case 65:
            return {
                text: "Interesting answer.",
                next: 66
            };

        case 66:
            return {
                text: "Maybe we should hang out again sometime.",
                next: -1
            };

        // GOOD PATH
        case 70:
            return {
                text: "Maybe we could get coffee sometime.",
                next: -1
            };

        // BAD PATH
        case 80:
            return {
                text: "I think… maybe this isn’t really working.",
                next: -1
            };

        // HARD FAIL
        case 900:
            return {
                text: "Right. Okay. I won’t bother you anymore.",
                next: -1
            };
    }
}