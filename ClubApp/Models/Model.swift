//
//  Model.swift
//  ClubApp
//
//  Created by Bhagyashree Haresh Khatri on 11/02/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit

class Model: NSObject {
    
    struct Company {
        var name = String()
        var description = String()
        var website = String()
        var logo = String()
        var isFollowing = String()
        var isFavourite = String()
        var membersList = [members]()
    }
    
    
    struct members {
        var name = String()
        var age = Int()
        var number = Int()
        var email = String()
        var isMemberFavourite = String()
        
    }
    
}
