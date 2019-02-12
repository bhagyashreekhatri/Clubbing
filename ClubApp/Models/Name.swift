//
//  Name.swift
//  ClubApp
//
//  Created by Bhagyashree Haresh Khatri on 11/02/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.

import Foundation

struct Name : Codable {
    
    var first = String()
    var last = String()
    
    enum CodingKeys: String, CodingKey {
        case first = "first"
        case last = "last"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        first = try values.decodeIfPresent(String.self, forKey: .first) ?? ""
        last = try values.decodeIfPresent(String.self, forKey: .last) ?? ""
    }
    
}
