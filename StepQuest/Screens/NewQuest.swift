//
//  NewQuest.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 27/05/2024.
//

import SwiftUI

struct NewQuest: View {
    var body: some View {
        ZStack {
            Background()
            CharacterWithText(
                character: CharacterType.questgiver,
                text: """
        Hey! I’m the Quest Giver. Let me know
        what sort of quest you want. The Townsfolk are always looking for someone to complete their errands!
        """,
                buttons: [
                    ButtonInfo(text: "Give me a less strenuous quest", action: { print("Selected option: Yes, I will help!") }),
                    ButtonInfo(text: "Give me a difficult quest", action: { print("Selected option: Yes, I will help!") }),
                    ButtonInfo(text: "Give me a regular quest", action: { print("Selected option: No, I can't right now.") })
                ]
            )
        }
    }
}

#Preview {
    NewQuest()
}
