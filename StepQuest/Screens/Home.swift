//
//  Home.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 23/05/2024.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var questStore: QuestStore
    @EnvironmentObject var stepStore: StepStore
    
    var body: some View {
        ZStack {
            Background()
            VStack() {
                QuestHeader(header: questStore.currentQuest?.details.title)
                if questStore.currentQuest != nil {
                    StepProgress(currentSteps: stepStore.currentSteps, totalSteps: questStore.currentQuest?.details.steps ?? 0)
                }
                Spacer()
                QuickActions()
            }
        }
        .onAppear {
            stepStore.requestHealthKitAuthorization(currentQuest: questStore.currentQuest)
        }
    }
}

#Preview {
    let questStore: QuestStore = {
        let store = QuestStore()
        
        store.setCurrentQuest(Quest(
            id: "1",
            details: QuestDetails(title: "Fungus Foraging", objective: "Walk 500 steps to find fungus", steps: 500, character: CharacterType.townfolk1)
        ))
        return store
    }()
    
    let stepStore = StepStore()
    stepStore.setCurrentSteps(250)
    
    return Home()
        .environmentObject(questStore)
        .environmentObject(stepStore)
}
