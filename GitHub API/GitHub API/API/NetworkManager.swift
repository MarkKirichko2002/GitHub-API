//
//  NetworkManager.swift
//  GitHub API
//
//  Created by Марк Киричко on 27.09.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func getUsers(completion: @escaping ([User]?) -> Void)
}

struct NetworkManager: NetworkManagerProtocol{
    func getUsers(completion: @escaping ([User]?) -> Void) {
        let fullUrl = API.url
            guard let url = URL(string: fullUrl) else { return }
        URLSession.shared.dataTask(with: URL(string: fullUrl)!) { (data, _, error) in
            guard let data = data else {return}
            
            do {
                let user = try JSONDecoder().decode([User].self, from: data)
                completion(user)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func GetCurrentUser(login: String, completion: @escaping(User)->()) {
        let url = "https://api.github.com/users/\(login)"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, _, error) in
            guard let data = data else {return}
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                completion(user)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T?{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}


