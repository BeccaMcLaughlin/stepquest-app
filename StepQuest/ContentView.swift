//
//  ContentView.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 19/05/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var stepStore = StepStore()
    @StateObject private var questStore = QuestStore()
    
    
    var body: some View {
        NavigationStack {
            Home()
        }
        .navigationTitle("Quests")
        .environmentObject(questStore)
        .environmentObject(stepStore)
        .onAppear {
            questStore.setStepStore(stepStore: stepStore)
            stepStore.requestHealthKitAuthorization(currentQuest: questStore.currentQuest)
        }
    }
}


#Preview {
    ContentView()
}
