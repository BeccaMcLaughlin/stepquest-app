//
//  HealthKitService.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 28/05/2024.
//

import Foundation
import HealthKit

class HealthKitService {
    private let healthStore = HKHealthStore()
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let readTypes: Set = [stepType]
        
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            completion(success, error)
        }
    }
    
    func fetchSteps(startDate: Date, endDate: Date, completion: @escaping (Int?, Error?) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(nil, error)
                return
            }
            let steps = Int(sum.doubleValue(for: HKUnit.count()))
            completion(steps, nil)
        }
        
        healthStore.execute(query)
    }
}
