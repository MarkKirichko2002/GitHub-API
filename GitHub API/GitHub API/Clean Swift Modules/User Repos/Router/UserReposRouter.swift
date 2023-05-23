//
//  UserReposRouter.swift
//  GitHub API
//
//  Created by Марк Киричко on 10.10.2022.
//

import Foundation
import UIKit

protocol UserReposRoutingLogic {
    func navigateToRepoInfo(login: String)
}

protocol UserReposDataPassing {
    var dataStore: UserReposStoreProtocol? {get}
}

class UserReposRouter: UserReposDataPassing {
    
    weak var viewController: UIViewController?
    
    var dataStore: UserReposStoreProtocol?
    
}

extension UserReposRouter: UserReposRoutingLogic {
    func navigateToRepoInfo(login: String) {
        
    }
}
