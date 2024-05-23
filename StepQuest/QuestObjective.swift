//
//  QuestHistoryItem.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 19/05/2024.
//

import SwiftUI

struct QuestObjective: View {
    let objective: String;
    let character: String;
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // Background Rectangle with RGBA color
            Rectangle()
                .fill(Color(red: 0/255, green: 6/255, blue: 63/255, opacity: 0.37))
                .frame(maxWidth: .infinity)
            
            // Gradient Overlay
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 0.43, green: 0.43, blue: 0.43, opacity: 0.5),
                Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.6)
            ]), startPoint: .top, endPoint: .bottom)
            .frame(maxWidth: .infinity)
            
            // Text
            HStack {
                Text(objective)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .frame(width: 250)
                Spacer()
            }
                Image(character)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 100)
                    .offset(x: 50, y: 75)
        }
        .frame(height: 200)
        .clipped()
        .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
        Spacer()
            .frame(height: 8.0)
    }
}

#Preview {
    QuestObjective(objective: """
Current objective:

Find a lost toy for a child.
""", character: "wizard")
}
