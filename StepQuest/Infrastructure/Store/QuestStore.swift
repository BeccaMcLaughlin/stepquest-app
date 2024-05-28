import SwiftUI
import Combine

class QuestStore: ObservableObject {
    @Published var quests: [Quest] = []
    @Published var currentQuest: Quest?;
    @Published var questDifficulty: QuestDifficulty = QuestDifficulty.easy;
    
    let stepStore: StepStore? = nil
    
    func setCurrentQuest(_ quest: Quest) {
        DispatchQueue.main.async {
            self.currentQuest = quest
            self.stepStore?.resetCurrentSteps()
        }
    }
    
    func addQuest(_ quest: Quest) {
        DispatchQueue.main.async {
            self.quests.append(quest)
        }
    }
}
