//
//  ErrorDict.swift
//  Project
//
//  Created by Nugumanov on 27.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

struct ErrorDict: Decodable, Error {
    let error: ServiceError
}
