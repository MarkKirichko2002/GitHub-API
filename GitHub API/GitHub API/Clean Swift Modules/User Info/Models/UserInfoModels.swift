//
//  UserInfoModels.swift
//  GitHub API
//
//  Created by Марк Киричко on 30.09.2022.
//

import Foundation

enum UserInfoModelsEnum {
    enum Model {
        
        struct Request {
            enum RequestType {
                case GetUser
            }
        }
        
        struct Response {
            enum ResponseType {
                case presentUserInfo(users: User)
            }
        }
        
        struct ViewModel {
            enum ViewModelData {
                case displayUserInfo(userViewModel: UserInfoViewModel)
            }
        }
    }
}

struct UserInfoViewModel {
    let name: String
    let login: String
    let image: String
    let repos: Int
    let followers: Int
    let following: Int
}

