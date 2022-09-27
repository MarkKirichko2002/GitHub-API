//
//  Models.swift
//  GitHub API
//
//  Created by Марк Киричко on 27.09.2022.
//

import Foundation

enum UsersModelsEnum {
    enum Model {
        
        struct Request {
            enum RequestType {
                case GetUsers
            }
        }
        
        struct Response {
            enum ResponseType {
                case presentUsers(users: [User])
            }
        }
        
        struct ViewModel {
            enum ViewModelData {
                case displayUsers(usersViewModel: [UsersViewModel])
            }
        }
    }
}

struct UsersViewModel {
    let login: String
    let image: String
    let id: Int
}
