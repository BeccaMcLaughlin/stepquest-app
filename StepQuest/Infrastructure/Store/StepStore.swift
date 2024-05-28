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
    
    func requestHealthKitAuthorization() {
        healthKitService.requestAuthorization { success, error in
            if success {
                self.fetchSteps()
            } else {
                print("HealthKit authorization failed: \(String(describing: error))")
            }
        }
    }
    
    private func fetchSteps() {
        healthKitService.fetchSteps { steps, error in
            if let steps = steps {
                self.setCurrentSteps(steps)
            } else {
                print("Failed to fetch steps: \(String(describing: error))")
            }
        }
    }
}
