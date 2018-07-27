//
//  ServiceError.swift
//  Project
//
//  Created by Nugumanov on 27.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import Foundation

struct ServiceError: Decodable {
    let code: Int
    let message: String
}
