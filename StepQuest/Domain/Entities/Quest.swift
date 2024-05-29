//
//  Quest.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 23/05/2024.
//

import Foundation

struct Quest: Identifiable, Decodable {
    let id: String;
    let details: QuestDetails;
    var completedDate: Date? = nil;
    let startDate: Date = Date();
    
    var completedDateString: String {
        get {
            guard let completedDate = completedDate else { return "" }
            let dateFormatter = DateFormatter();
            dateFormatter.dateFormat = "d MMM yyyy"
            return dateFormatter.string(from: completedDate)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id, details
    }
    
    init(id: String, details: QuestDetails, completedDate: Date? = nil) {
        self.id = id
        self.details = details
        self.completedDate = completedDate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        details = try container.decode(QuestDetails.self, forKey: .details)
    }
}
