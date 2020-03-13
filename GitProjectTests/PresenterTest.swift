//
//  PresenterTest.swift
//  GitProjectTests
//
//  Created by anunes on 06/03/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import XCTest
@testable import GitProject

class PresenterTest: XCTestCase {

     let presenter = HomePresenter()
     let viewControllerSpy = HomeViewControllerSpy()
     var response: Home.Git.Response?

    func loadMock(){
        let mock = FakeService()
        let gitModel = mock.getMock(model: GitModel.self, file: mock.getData(name: "GitModel"))
        if let git = gitModel{
            response = Home.Git.Response(gitModel: git)
        }else{
            XCTAssertNotNil(response)
        }
    }

    override func setUp() {
        loadMock()
        presenter.viewController = viewControllerSpy
    }

    func testPresenter(){
        let response = self.response!
        presenter.presentGit(response: response)
        let viewModel = (presenter.viewController as! PresenterTest.HomeViewControllerSpy).viewModeDummy

         XCTAssertEqual(viewModel?.gitRepresentable[0].avatar, "https://avatars3.githubusercontent.com/u/36260787?v=4")
         XCTAssertEqual(viewModel?.gitRepresentable[0].description, ":books: 技术面试必备基础知识、Leetcode、计算机操作系统、计算机网络、系统设计、Java、Python、C++")
         XCTAssertEqual(viewModel?.gitRepresentable[0].likes, "29975")
         XCTAssertEqual(viewModel?.gitRepresentable[0].shared, "92514")
         XCTAssertEqual(viewModel?.gitRepresentable[0].surName, "CyC2018/CS-Notes")
         XCTAssertEqual(viewModel?.gitRepresentable[0].title, "CS-Notes")
         XCTAssertEqual(viewModel?.gitRepresentable[0].userName, "CS-Notes")
         XCTAssertNotNil(viewModel)
    }

    func testError(){
        //arranje
        let erro = NSError(domain: "Erro na requisição da Tabela", code: 500, userInfo:nil)
        //ACT
        presenter.presentError(error: Home.Git.GitError(erro: erro))
        //asset
        XCTAssertNotNil(erro)
    }
    
}


extension PresenterTest{
    class HomeViewControllerSpy: HomeDisplayLogic {
        var erroDummy: Home.Git.GitError?
        var viewModeDummy: Home.Git.ViewModel?

        func displayGit(viewModel: Home.Git.ViewModel) {
            viewModeDummy = viewModel
        }

        func displayError(viewModel: Home.Git.GitError) {
            erroDummy = viewModel
        }

    }
}
