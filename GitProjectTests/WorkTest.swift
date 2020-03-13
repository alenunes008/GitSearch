//
//  IntegrationTest.swift
//  GitProjectTests
//
//  Created by anunes on 06/03/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import XCTest
@testable import GitProject

class IntegrationTest: XCTestCase {

    func testService() {
        let expectation = XCTestExpectation(description: "testWork")
        let requestable = WorkerRequestable()
        let req: HTTRequest<GitModel> = HTTRequest(requestable: requestable)
        req.get(success: { success in
            XCTAssertNotNil(success)
            expectation.fulfill()

        }) {erro in
            XCTAssertNil(erro)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 60.0)
    }

}
