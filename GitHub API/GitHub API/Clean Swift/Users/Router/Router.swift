//
//  Router.swift
//  GitHub API
//
//  Created by Марк Киричко on 27.09.2022.
//

import Foundation
import UIKit

protocol UsersRoutingLogic {
    func navigateToDetails(login: String)
}

class UsersRouter: UsersRoutingLogic {

    weak var viewController: UIViewController?
    
    func navigateToDetails(login: String) {
        let storyboard = UIStoryboard.init(name: "UserInfoViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "UserInfoViewController") as? UserInfoViewController else {return}
        vc.router?.dataStore?.login = login
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
