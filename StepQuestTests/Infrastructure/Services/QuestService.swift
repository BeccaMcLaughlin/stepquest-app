//
//  QuestService.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 27/05/2024.
//

import XCTest
@testable import StepQuest

class QuestServiceTests: XCTestCase {
    var questService: QuestService!
    let sampleQuestJSON = """
    {
        "id": "12345",
        "details": {
            "id": "details-id",
            "objective": "Test objective",
            "title": "Test Title",
            "steps": 500,
            "character": "townfolk1"
        }
    }
    """

    override func setUp() {
        super.setUp()
        questService = QuestService()
        URLProtocol.registerClass(MockURLProtocol.self)
    }

    override func tearDown() {
        super.tearDown()
        URLProtocol.unregisterClass(MockURLProtocol.self)
        questService = nil
    }

    func testFetchNewQuestSuccess() {
        let expectation = self.expectation(description: "Fetch new quest success")

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            let data = self.sampleQuestJSON.data(using: .utf8)!
            return (response, data)
        }

        questService.FetchNewQuest(difficulty: .easy) { result in
            switch result {
            case .success(let quest):
                XCTAssertEqual(quest.id, "12345")
                XCTAssertEqual(quest.details.objective, "Test objective")
                XCTAssertEqual(quest.details.title, "Test Title")
                XCTAssertEqual(quest.details.steps, 500)
                XCTAssertEqual(quest.details.character, CharacterType.townfolk1)
                expectation.fulfill()
            case .failure:
                XCTFail("Expected success, got failure")
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFetchNewQuestFailure() {
        let expectation = self.expectation(description: "Fetch new quest failure")

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 500, httpVersion: nil, headerFields: nil)!
            let data = Data()
            return (response, data)
        }

        questService.FetchNewQuest(difficulty: .easy) { result in
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}

