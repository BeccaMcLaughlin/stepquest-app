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
                StepProgress(currentSteps: 100, totalSteps: 500)
                Text("Hello, world!")
                    .font(.title)
                HStack() {
                    Text("Allo there")
                        .font(.subheadline)
                    Text("AMmm")
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
