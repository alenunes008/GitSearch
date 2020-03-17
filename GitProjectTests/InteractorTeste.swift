//
//  HomeInteractorTeste.swift
//  GitProjectTests
//
//  Created by anunes on 06/03/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import XCTest
@testable import GitProject

class HomeInteractorTeste: XCTestCase {

    var response: Home.Git.Response?
    var interactor: HomeInteractor?
    var homePresentSpy: PresentSpy!

    override func setUp() {
        interactor = HomeInteractor()
        interactor?.worker = WorkSpy()
        homePresentSpy = PresentSpy()
        interactor?.presenter = homePresentSpy
        loadMock()
    }

    func testInteractor() {
        interactor?.doInteractorGit(identificador: "1")
        let viewModel = homePresentSpy?.response
        XCTAssertNotNil(viewModel)
    }

     func loadMock() {
         let mock = FakeService()
         let gitModel = mock.getMock(model: GitModel.self, file: mock.getData(name: "GitModel"))
         if let git = gitModel {
             response = Home.Git.Response(gitModel: git)
         } else {
             XCTAssertNotNil(response)
         }
     }

}
extension HomeInteractorTeste {
    class PresentSpy: HomePresentationLogic {
        var response: Home.Git.Response?
        var error: Home.Git.GitError?

        func presentGit(response: Home.Git.Response) {
            self.response = response
        }

        func presentError(error: Home.Git.GitError) {
            self.error = error
        }
    }
}

class WorkSpy: HomeWorker {
    let response: GitModel?

    override init() {
        let mock = FakeService()
        response = mock.getMock(model: GitModel.self, file: mock.getData(name: "GitModel"))
    }

    override func doWorkGit(request: Home.Git.Request) {
        if let git = response {
            request.completion(.success(git))
        } else {
            request.completion(.failure(NSError(domain: "Erro na requisição da Tabela", code: 500, userInfo: nil)))
        }
    }

}
