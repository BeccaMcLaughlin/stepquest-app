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
    private let healthKitService = HealthKitService()
    
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
    
    func requestHealthKitAuthorization(currentQuest: Quest?) {
        healthKitService.requestAuthorization { success, error in
            if success {
                if (currentQuest != nil ) {
                    self.fetchSteps(currentQuest: currentQuest!)
                }
            } else {
                print("HealthKit authorization failed: \(String(describing: error))")
            }
        }
    }
    
    private func fetchSteps(currentQuest: Quest) {
        healthKitService.fetchSteps(startDate: currentQuest.startDate, endDate: Date()) { steps, error in
            if let steps = steps {
                self.setCurrentSteps(steps)
            } else {
                print("Failed to fetch steps: \(String(describing: error))")
            }
        }
    }
}
