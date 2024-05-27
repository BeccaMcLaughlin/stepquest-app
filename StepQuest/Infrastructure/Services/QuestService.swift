//
//  QuestService.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 27/05/2024.
//

import Foundation

class QuestService {
    func FetchNewQuest(difficulty: QuestDifficulty, completion: @escaping (Result<Quest, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/new?difficulty=\(difficulty.rawValue)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let quest = try JSONDecoder().decode(Quest.self, from: data)
                completion(.success(quest))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    static func fetchAndStoreQuest(difficulty: QuestDifficulty, questStore: QuestStore, questService: QuestService, completion: @escaping () -> Void) {
        questService.FetchNewQuest(difficulty: difficulty) { result in
                switch result {
                case .success(let newQuest):
                    questStore.setCurrentQuest(newQuest)
                    completion()
                case .failure(let error):
                    // Handle the error, e.g., log it or display an alert
                    print("Error fetching new quest: \(error)")
                }
            }
    }
}
