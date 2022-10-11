//
//  UserInfoRouter.swift
//  GitHub API
//
//  Created by Марк Киричко on 30.09.2022.
//

import Foundation
import UIKit

protocol UserInfoRoutingLogic {
    func navigateToRepos(login: String)
}

protocol UserInfoDataPassing {
    var dataStore: UserInfoStoreProtocol? {get}
}

class UserInfoRouter: UserInfoDataPassing {
    
    weak var viewController: UIViewController?
    
    weak var dataStore: UserInfoStoreProtocol?
    
}

extension UserInfoRouter: UserInfoRoutingLogic {
    
    func navigateToRepos(login: String) {
        let storyboard = UIStoryboard.init(name: "UserReposTableViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "UserReposTableViewController") as? UserReposTableViewController else {return}
        vc.router?.dataStore?.login = login
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
