//
//  QuickActions.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 23/05/2024.
//

import SwiftUI

struct QuickActions: View {
    let currentQuest: Quest;
    var body: some View {
        VStack {
            QuestObjective(objective: currentQuest.details.title, character: currentQuest.details.character)
            HStack {
                QuickAction(text: "New quest")
                QuickAction(text: "Quest history")
            }
        }.padding()
    }
}

#Preview {
    QuickActions(
        currentQuest: Quest(id: "test", details: QuestDetails(title: "Fungus Foraging", objective: "Test", totalSteps: 500, character: CharacterType.wizard))
    )
}

