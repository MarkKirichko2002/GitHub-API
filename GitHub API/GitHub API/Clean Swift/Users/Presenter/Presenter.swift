//
//  Presenter.swift
//  GitHub API
//
//  Created by Марк Киричко on 27.09.2022.
//

import Foundation

protocol UsersPresentationLogic {
    func presentData(response: UsersModelsEnum.Model.Response.ResponseType)
}

class UsersPresenter: UsersPresentationLogic {
    
    weak var viewController: UsersDisplayLogic?
    
    func presentData(response: UsersModelsEnum.Model.Response.ResponseType) {
        switch response {
        case .presentUsers(let users):
            var userCells: [UsersViewModel] = []
            users.forEach { user in
                userCells.append(UsersViewModel(login: user.login ?? "", image: user.avatarURL ?? "", id: user.id ?? 0))
            }
            viewController?.displayData(viewModel: .displayUsers(usersViewModel: userCells))
        }
    }
}
