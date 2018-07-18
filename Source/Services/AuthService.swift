//
//  AuthService.swift
//  Project
//
//  Created by Nugumanov on 17.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//
// swiftlint:disable trailing_whitespace
import Foundation

class AuthService {
    
    enum Error: Swift.Error {
        case badUrl
        case badJson
        case incorrectData
        case api(error: Swift.Error)
    }
    
    func auth(email: String, passsword: String, completion: @escaping (String?, Error?) -> Void) {
        let urlString = Config.baseUrl + "/auth"
        
        guard  let url = URL(string: urlString) else {
            completion(nil, .badUrl)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let dict = ["email": email, "password": passsword]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: []) else {
            completion(nil, .badJson)
            return
        }
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(nil, .api(error: error))
                return
            }
            guard
                let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []),
                let dict = json as? [String: String],
                let token = dict["key"]
            else {
                completion(nil, .incorrectData)
                return
            }
            completion(token, nil)
        }
        task.resume()
    }
}
