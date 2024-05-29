import SwiftUI
import Combine

class QuestStore: ObservableObject {
    @Published var quests: [Quest] = []
    @Published var currentQuest: Quest?;
    @Published var questDifficulty: QuestDifficulty = QuestDifficulty.easy;
    
    var stepStore: StepStore? = nil
    
    func setCurrentQuest(_ quest: Quest) {
        DispatchQueue.main.async {
            self.currentQuest = quest
            self.stepStore?.resetCurrentSteps()
            self.stepStore?.requestHealthKitAuthorization(currentQuest: self.currentQuest)
        }
    }
    
    func addQuest(_ quest: Quest) {
        DispatchQueue.main.async {
            self.quests.append(quest)
        }
    }
    
    func setStepStore(stepStore: StepStore) {
        self.stepStore = stepStore
    }
}
