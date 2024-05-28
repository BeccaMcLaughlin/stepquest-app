//
//  StepStore.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 28/05/2024.
//

import Foundation
import Combine

class StepStore: ObservableObject {
    @Published var currentSteps: Int = 0
    
    func resetCurrentSteps() {
        DispatchQueue.main.async {
            self.currentSteps = 0
        }
    }
    
    func setCurrentSteps(_ steps: Int) {
        DispatchQueue.main.async {
            self.currentSteps = steps
        }
    }
}
