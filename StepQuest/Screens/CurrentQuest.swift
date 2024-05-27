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
            if questStore.currentQuest?.details != nil {
                CharacterWithText(
                    character: questStore.currentQuest!.details.character,
                    text: questStore.currentQuest!.details.objective,
                    buttons: []
                )
            }
        }
    }
}

#Preview {
    CurrentQuest()
}
