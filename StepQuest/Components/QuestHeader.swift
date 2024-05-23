//
//  QuestHeader.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 23/05/2024.
//

import SwiftUI

struct QuestHeader: View {
    let header: String?;
    
    var body: some View {
        VStack(spacing: -2) {
            Text("Your current quest:")
            Text(header ?? "None")
                .font(.largeTitle)
            .fontWeight(.semibold)
        }
        .foregroundColor(.white)
        .padding()
    }
}

#Preview {
    ZStack {
        Color.blue.edgesIgnoringSafeArea(.all)
        QuestHeader(header: nil)
    }
}
