//
//  ContentView.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 19/05/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        ZStack {
            Background()
            
            VStack() {
                QuestHeader(header: nil)
                StepProgress(currentSteps: 100, totalSteps: 500)
                Spacer()
            }
        }
    }
}


#Preview {
    ContentView()
}
