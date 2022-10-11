//
//  UserReposPresenter.swift
//  GitHub API
//
//  Created by Марк Киричко on 10.10.2022.
//

import Foundation

protocol UserReposPresentationLogic {
    func presentReposData(response: UserReposModelsEnum.Model.Response.ResponseType)
}

class UserReposPresenter: UserReposPresentationLogic {
    
    weak var viewController: UserReposDisplayLogic?
    
    func presentReposData(response: UserReposModelsEnum.Model.Response.ResponseType) {
        switch response {
        case .presentUserRepos(let repos):
            var userRepoCells: [UserReposViewModel] = []
            repos.forEach { repo in
                userRepoCells.append(UserReposViewModel(name: repo.name ?? "нет имени", description: repo.repoDescription ?? "нет описания", language: repo.language ?? "отсутствует"))
                viewController?.displayData(viewModel: .displayUserRepos(userReposViewModel: userRepoCells))
            }
        }
    }
}
