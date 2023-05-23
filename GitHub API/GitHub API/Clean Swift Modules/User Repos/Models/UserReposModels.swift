//
//  UserReposModel.swift
//  GitHub API
//
//  Created by Марк Киричко on 10.10.2022.
//

import Foundation

enum UserReposModelsEnum {
    enum Model {
        
        struct Request {
            enum RequestType {
                case GetUserRepos
            }
        }
        
        struct Response {
            enum ResponseType {
                case presentUserRepos(repos: [Repo])
            }
        }
        
        struct ViewModel {
            enum ViewModelData {
                case displayUserRepos(userReposViewModel: [UserReposViewModel])
            }
        }
    }
}

struct UserReposViewModel {
    let name: String
    let description: String
    let language: String
}


