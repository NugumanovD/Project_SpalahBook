//
//  RegisterService.swift
//  Project
//
//  Created by Nugumanov on 19.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import Foundation

class RegisterService {
    
    enum Error: Swift.Error {
        case badUrl
        case badJson
        case incorrectData
        case api(error: Swift.Error)
    }
    
    func register(name: String, description: String, email: String, password: String, image: String, complation: @escaping (String?, Error?)-> Void) {
        let urlString = Config.baseUrl + "/auth"
        
        guard let url = URL(string: urlString) else {
            complation(nil, .badUrl)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let dict = ["name": name, "description": description, "email": email, "password": password, "image": image]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: []) else {
            complation(nil, .badJson)
            return
        }
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                complation(nil, .api(error: error))
                return
            }
            guard
                let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []),
                let dict = json as? [String: String],
                let token = dict["key"]
            else {
                complation(nil, .incorrectData)
                    return
            }
            complation(token, nil)
        }
        task.resume()
    }
}
