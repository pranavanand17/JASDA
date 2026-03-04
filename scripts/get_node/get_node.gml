function get_node(_id)
{
    switch(_id)
    {
        case 0:
            return {
                text: "Oh… hi.",
                next: 1
            };

        case 1:
            return {
                text: "Do you actually use apps like this?",
                choices: [
                    { text: "Yeah, why not?", next: 2, aff: 1 },
                    { text: "No, this is embarrassing.", next: 3, aff: -1 }
                ]
            };

        case 2:
            return {
                text: "That’s… surprisingly honest.",
                next: 4
            };

        case 3:
            return {
                text: "Oh. So I’m embarrassing?",
                next: 4
            };

        case 4:
            return {
                text: "Anyway… what do you think of me so far?",
                input: true,
                next: 5
            };

        case 5:
            return {
                text: "Interesting answer.",
                next: -1
            };
    }
}