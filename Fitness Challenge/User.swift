//
//  User.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/21/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import Foundation

struct User {
    private var _firstName: String
    private var _uid: String
    
    var uid: String {
        return _uid
    }
    
    var firstName: String {
        return _firstName
    }
    
    init(uid: String, firstName: String) {
        _uid = uid
        _firstName = firstName
        
    }
}
