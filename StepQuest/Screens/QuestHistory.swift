//
//  QuestHistory.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 26/05/2024.
//

import SwiftUI

struct QuestHistory: View {
    @EnvironmentObject var questStore: QuestStore
    
    var body: some View {
        ZStack {
            Background()
            VStack(alignment: .leading) {
                Text("Quest History:")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                ScrollView {
                    ForEach(questStore.quests) { quest in QuestHistoryItem(questTitle: quest.details.title, questSteps: quest.details.totalSteps, questCompleted: quest.completedDateString, character: quest.details.character)
                    }
                }
            }
            .safeAreaPadding()
        }
    }
}

#Preview {
    let questStore: QuestStore = {
        let store = QuestStore()
        store.addQuest(Quest(
            id: "1",
            details: QuestDetails(title: "Fungus Foraging", objective: "Test", totalSteps: 500, character: CharacterType.townfolk1),
            completedDate: Date()
        ))
        store.addQuest(Quest(
            id: "2",
            details: QuestDetails(title: "Feather of the Moonbird", objective: "Test", totalSteps: 500, character: CharacterType.wizard),
            completedDate: Date()
        ))
        store.addQuest(Quest(
            id: "3",
            details: QuestDetails(title: "The Elder's Message", objective: "Test", totalSteps: 500, character: CharacterType.townfolk2),
            completedDate: Date()
        ))
        store.addQuest(Quest(
            id: "4",
            details: QuestDetails(title: "The Lost Toy", objective: "Test", totalSteps: 500, character: CharacterType.townfolk1),
            completedDate: Date()
        ))
        store.addQuest(Quest(
            id: "5",
            details: QuestDetails(title: "Gone Fishing", objective: "Test", totalSteps: 500, character: CharacterType.townfolk2),
            completedDate: Date()
        ))
        store.addQuest(Quest(
            id: "6",
            details: QuestDetails(title: "Rescue Matilda", objective: "Test", totalSteps: 500, character: CharacterType.townfolk2),
            completedDate: Date()
        ))
        return store
    }()
    
    return  QuestHistory()
        .environmentObject(questStore)
}
