//
//  Background.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 23/05/2024.
//

import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [ Color(red: 132/255, green: 122/255, blue: 255/255), Color(red: 69/255, green: 22/255, blue: 129/255)]),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Background()
}
