//
//  Data.swift
//  Project
//
//  Created by Nugumanov on 27.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import Foundation

extension Data {
    var json: Any? {
        let string = String(data: self, encoding: .utf8)
        let cleanString = string?.replacingOccurrences(of: "'", with: "\"")
        guard let data = cleanString?.data(using: .utf8) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: [])
    }
}
