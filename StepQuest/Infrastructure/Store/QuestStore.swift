import SwiftUI
import Combine

class QuestStore: ObservableObject {
    @Published var quests: [Quest] = []
    @Published var currentQuest: Quest?;
    
    func setCurrentQuest(_ quest: Quest) {
        currentQuest = quest;
    }
    
    func addQuest(_ quest: Quest) {
        quests.append(quest)
    }
    
    func removeQuest(at index: Int) {
        quests.remove(at: index)
    }
}
