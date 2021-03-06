//
//  DetailInteractor.swift
//  GitProject
//
//  Created by anunes on 09/03/20.
//  Copyright (c) 2020 Santander Tecnologia. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailBusinessLogic {
    func doPullsInteractor(request: Detail.PullsRequest.Request)
    var requestFullName: String? { get }
}

protocol DetailDataStore {
    var fullName: String? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var fullName: String?

    var presenter: DetailPresentationLogic?
    var worker: DetailWorker?
    // MARK: Do something
    func doPullsInteractor(request: Detail.PullsRequest.Request) {
        worker = DetailWorker()
        worker?.doPullRequest(request: request, completion: { (result) in
            switch result {
            case .success(let model):
                let response = Detail.PullsRequest.Response(pulls: model)
                self.presenter?.presentPulls(response: response)
            case .failure(let erro):
                let erroGit = Detail.PullsRequest.GitError(erro: erro)
                self.presenter?.presenterErro(error: erroGit)
            }
        })
    }

    var requestFullName: String? {
        fullName
    }

}
