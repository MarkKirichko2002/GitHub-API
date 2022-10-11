//
//  UserReposInteractor.swift
//  GitHub API
//
//  Created by Марк Киричко on 10.10.2022.
//

import Foundation

protocol UserReposBusinessLogic {
    func GetUserRepos(request: UserReposModelsEnum.Model.Request.RequestType)
}

protocol UserReposStoreProtocol: class {
    var login: String {get set}
}

class UserReposInteractor: UserReposStoreProtocol {
    
    var networkManager = NetworkManager()

    var presenter: UserReposPresentationLogic?
    
    var login: String = ""
    
}

extension UserReposInteractor: UserReposBusinessLogic {
    func GetUserRepos(request: UserReposModelsEnum.Model.Request.RequestType) {
        switch request {
        case .GetUserRepos:
            GetUserRepos()
        }
        
        func GetUserRepos() {
            self.networkManager.GetCurrentUserRepos(login: login) { repo in
                guard let repos = repo else {return}
                print(repos)
                self.presenter?.presentReposData(response: .presentUserRepos(repos: repos))
            }
        }
        
    }
}
