//
//  Member.swift
//  ClubApp
//
//  Created by Bhagyashree Haresh Khatri on 11/02/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.

import Foundation

struct Member : Codable {
    
    var id = String()
    var age = Int()
    var email = String()
    var name : Name?
    var phone = String()
    var isMemberFavourite : String? = "No"
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case age = "age"
        case email = "email"
        case name = "name"
        case phone = "phone"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        age = try values.decodeIfPresent(Int.self, forKey: .age) ?? 0
        email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
        name = try values.decodeIfPresent(Name.self, forKey: .name)
        phone = try values.decodeIfPresent(String.self, forKey: .phone) ?? ""
    }
    
}
