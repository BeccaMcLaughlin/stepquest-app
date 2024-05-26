//
//  ContentView.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 19/05/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var questStore = QuestStore()
    
    var body: some View {
        NavigationStack {
            Home(currentSteps: 0)
        }
        .navigationTitle("Quests")
        .environmentObject(questStore)
    }
}


#Preview {
    ContentView()
}
