//
//  QuickActions.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 23/05/2024.
//

import SwiftUI

struct QuickActions: View {
    @EnvironmentObject var questStore: QuestStore
    
    var body: some View {
        VStack {
            QuestObjective(objective: questStore.currentQuest?.details.objective ?? "None", character: questStore.currentQuest?.details.character ?? CharacterType.wizard)
            HStack {
                NavigationLink {
                    NewQuest()
                } label: {
                    QuickAction(text: "New quest")
                }
                NavigationLink {
                    QuestHistory()
                } label: {
                    QuickAction(text: "Quest history")
                }
            }
        }.padding()
    }
}

#Preview {
    let questStore: QuestStore = {
        let store = QuestStore()
        store.setCurrentQuest(Quest(
            id: "1",
            details: QuestDetails(title: "Fungus Foraging", objective: "Test", steps: 500, character: CharacterType.townfolk1),
            completedDate: nil
        ))
        return store
    }()
    return QuickActions().environmentObject(questStore)
}

