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
        VStack(alignment: .leading) {
                Text("Hello, world!")
                .font(.title)
            HStack() {
                Text("Allo there")
                    .font(.subheadline)
                Spacer()
                Text("AMmm")
                    .font(.subheadline)
                }
            }
        .padding()
        }
}

#Preview {
    ContentView()
}
