//
//  HomeViewControllerTest.swift
//  GitProjectTests
//
//  Created by anunes on 06/03/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import XCTest
@testable import GitProject
class HomeViewControllerTest: XCTestCase {

    var viewController: HomeViewController!

    func testStoryBoard() {
        //Arrange
        let story = UIStoryboard(name: "Main", bundle: nil)
        viewController = story.instantiateViewController(withIdentifier: "HomeViewControllerID") as? HomeViewController
        //ACT
        viewController.loadView()
        //Assert
        XCTAssertNotNil(viewController.gitTableView)
    }
}
