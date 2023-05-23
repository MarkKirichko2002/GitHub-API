//
//  UserInfoPresenter.swift
//  GitHub API
//
//  Created by Марк Киричко on 30.09.2022.
//

import Foundation

protocol UserInfoPresentationLogic {
    func presentData(response: UserInfoModelsEnum.Model.Response.ResponseType)
}

class UserInfoPresenter: UserInfoPresentationLogic {
    
    weak var viewController: UserInfoDisplayLogic?
    
    func presentData(response: UserInfoModelsEnum.Model.Response.ResponseType) {
        switch response {
        case .presentUserInfo(let users):
            let user = UserInfoViewModel(name: users.name ?? "", login: users.login ?? "", image: users.avatarURL ?? "", repos: users.publicRepos ?? 0, followers: users.followers ?? 0, following: users.following ?? 0)
            viewController?.displayUserInfo(viewModel: .displayUserInfo(userViewModel: user))
        }
    }
    
}
