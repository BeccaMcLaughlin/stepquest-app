//
//  CurrentQuest.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 27/05/2024.
//

import SwiftUI

struct CurrentQuest: View {
    @EnvironmentObject var questStore: QuestStore
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                if questStore.currentQuest != nil {
                    Image(questStore.currentQuest!.details.character.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 400.0)
                    Text((questStore.currentQuest?.details.objective)!)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                Spacer()
                NavigationLink {
                    Home()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Okay")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .padding(.vertical, 2)
                }
            }
        }
    }
}

#Preview {
    let questStore: QuestStore = {
        let store = QuestStore()
        
        store.setCurrentQuest(Quest(
            id: "1",
            details: QuestDetails(title: "Fungus Foraging", objective: "Walk 500 steps to find fungus", steps: 500, character: CharacterType.townfolk1),
            completedDate: nil
        ))
        return store
    }()
    
    return CurrentQuest()
        .environmentObject(questStore)
}
