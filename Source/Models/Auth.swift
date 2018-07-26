//
//  Auth.swift
//  Project
//
//  Created by Nugumanov on 22.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import KeychainSwift

class Auth {
    static let current = Auth()
    private let keychain = KeychainSwift()
    private let storeIdentifier: String = "Key"
    
    var key: String? {
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: storeIdentifier)
            } else {
                keychain.delete(storeIdentifier)
            }
        }
        get {
            return keychain.get(storeIdentifier)
        }
    }
    
    var isAutorized: Bool {
        return key != nil && key?.isEmpty == false
    }
}
