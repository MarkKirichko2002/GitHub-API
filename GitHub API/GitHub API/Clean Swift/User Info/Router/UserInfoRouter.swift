//
//  UserInfoRouter.swift
//  GitHub API
//
//  Created by Марк Киричко on 30.09.2022.
//

import Foundation
import UIKit

protocol UserInfoRoutingLogic {
    
}

protocol UserInfoDataPassing {
    var dataStore: UserInfoStoreProtocol? {get}
}

class UserInfoRouter: UserInfoDataPassing {
    
    weak var viewController: UIViewController?
    
    weak var dataStore: UserInfoStoreProtocol?
    
}

extension UserInfoRouter: UserInfoRoutingLogic {
    
}
