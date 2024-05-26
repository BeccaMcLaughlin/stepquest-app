//
//  Quest.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 23/05/2024.
//

import Foundation

struct Quest: Identifiable {
    let id: String;
    let details: QuestDetails;
    var completedDate: Date?;

    private let dateFormatter = DateFormatter();
    
    var completedDateString: String {
       get {
           guard let completedDate = completedDate else { return "" }
           dateFormatter.dateFormat = "d MMM yyyy"
           return dateFormatter.string(from: completedDate)
       }
   }
}
