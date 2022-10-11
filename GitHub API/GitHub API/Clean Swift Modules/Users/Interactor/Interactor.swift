//
//  Interactor.swift
//  GitHub API
//
//  Created by Марк Киричко on 27.09.2022.
//

import Foundation

protocol UsersBusinessLogic {
    func makeRequest(request: UsersModelsEnum.Model.Request.RequestType)
}

class UsersInteractor: UsersBusinessLogic {
    
    var presenter: UsersPresentationLogic?
    
    var networkManager = NetworkManager()
    
    func makeRequest(request: UsersModelsEnum.Model.Request.RequestType) {
        switch request {
        case .GetUsers:
            GetUsers()
        }
    }
    
    func GetUsers() {
        self.networkManager.getUsers { users in
            guard let users = users else {return}
            self.presenter?.presentData(response: .presentUsers(users: users))
        }
    }
}
