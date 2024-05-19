//
//  Item.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 19/05/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
