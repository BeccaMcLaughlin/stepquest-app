//
//  Home.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 23/05/2024.
//

import SwiftUI

struct Home: View {
    let currentQuest: Quest;
    let currentSteps: Int;

    var body: some View {
        VStack() {
            QuestHeader(header: currentQuest.details.title)
            StepProgress(currentSteps: currentSteps, totalSteps: currentQuest.details.totalSteps)
            Spacer()
            QuickActions(currentQuest: currentQuest)
        }
    }
}

#Preview {
    ZStack {
        Background()
        Home(
            currentQuest: Quest(id: "test", details: QuestDetails(title: "Fungus Foraging", objective: "Test", totalSteps: 500, character: CharacterType.wizard)),
            currentSteps: 258
        )
    }
}
