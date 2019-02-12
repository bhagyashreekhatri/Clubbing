//
//  Company.swift
//  ClubApp
//
//  Created by Bhagyashree Haresh Khatri on 11/02/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.

import Foundation

struct Company : Codable {
    
        var id = String()
        var about = String()
        var company = String()
        var logo = String()
        var members : [Member]?
        var website = String()
        var isFavourite : String? = "No"
        var isFollowing : String? = "No"

        enum CodingKeys: String, CodingKey {
                case id = "_id"
                case about = "about"
                case company = "company"
                case logo = "logo"
                case members = "members"
                case website = "website"
        }
    
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
            about = try values.decodeIfPresent(String.self, forKey: .about) ?? ""
            company = try values.decodeIfPresent(String.self, forKey: .company) ?? ""
            logo = try values.decodeIfPresent(String.self, forKey: .logo) ?? ""
            members = try values.decodeIfPresent([Member].self, forKey: .members)
            website = try values.decodeIfPresent(String.self, forKey: .website) ?? ""
            
        }

}
