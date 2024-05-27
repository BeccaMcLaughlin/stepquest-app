//
//  QuestDetails.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 23/05/2024.
//

import Foundation

struct QuestDetails: Decodable {
    let title: String;
    let objective: String;
    let steps: Int;
    let character: CharacterType;
}
