//
//  UserInfoInteractor.swift
//  GitHub API
//
//  Created by Марк Киричко on 30.09.2022.
//

import Foundation

protocol UserInfoBusinessLogic {
    func GetUserInfo(request: UserInfoModelsEnum.Model.Request.RequestType)
}

protocol UserInfoStoreProtocol: class {
    var login: String {get set}
}

class UserInfoInteractor: UserInfoStoreProtocol {
    
    var networkManager = NetworkManager()
    
    var presenter: UserInfoPresentationLogic?
    
    var login: String = ""
}

extension UserInfoInteractor: UserInfoBusinessLogic {
    func GetUserInfo(request: UserInfoModelsEnum.Model.Request.RequestType) {
        switch request {
        case .GetUser:
            GetUser()
        }
    }
    
    func GetUser() {
        self.networkManager.GetCurrentUser(login: login) { user in
            print(user)
            self.presenter?.presentData(response: .presentUserInfo(users: user))
        }
    }
}
 
