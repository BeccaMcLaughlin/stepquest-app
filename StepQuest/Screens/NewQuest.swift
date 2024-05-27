import SwiftUI

struct NewQuest: View {
    @EnvironmentObject var questStore: QuestStore
    @State private var isLoading = false
    @State private var navigateToHome = false
    private let questService = QuestService()

    var body: some View {
        ZStack {
            Background()

            if isLoading {
                ProgressView("Fetching quest...")
            } else {
                CharacterWithText(
                    character: CharacterType.questgiver,
                    text: """
                    Hey! I’m the Quest Giver. Let me know
                    what sort of quest you want. The Townsfolk are always looking for someone to complete their errands!
                    """,
                    buttons: [
                        ButtonInfo(text: "Give me a less strenuous quest", action: { fetchQuest(difficulty: .easy) }),
                        ButtonInfo(text: "Give me a difficult quest", action: { fetchQuest(difficulty: .hard) }),
                        ButtonInfo(text: "Give me a regular quest", action: { fetchQuest(difficulty: .medium) })
                    ]
                )
            }
        }
        .navigationDestination(isPresented: $navigateToHome) {
            Home(currentSteps: 0)
                .environmentObject(questStore)
        }
    }

    private func fetchQuest(difficulty: QuestDifficulty) {
        isLoading = true
        QuestService.fetchAndStoreQuest(difficulty: difficulty, questStore: questStore, questService: questService) {
            isLoading = false
            navigateToHome = true
        }
    }
}

#Preview {
    let questStore = QuestStore()

    return NewQuest()
        .environmentObject(questStore)
}
