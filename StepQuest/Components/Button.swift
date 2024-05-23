//
//  ContentView.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 19/05/2024.
//

import SwiftUI
import SwiftData

struct Button: View {
    let text: String;
    
    var body: some View {
        Text(text)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

#Preview {
    Button(text: "Click me!")
}
