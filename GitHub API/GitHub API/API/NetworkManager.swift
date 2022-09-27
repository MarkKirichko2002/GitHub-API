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
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error received requesting data: \(error.localizedDescription)")
                    completion(nil)
                }
                let decoded = self.decodeJSON(type: [User].self, from: data)
                completion(decoded)
            }
            .resume()
    }
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T?{
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}


