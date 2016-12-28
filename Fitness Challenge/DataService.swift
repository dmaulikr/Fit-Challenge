//
//  DataService.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/20/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import Foundation
import FirebaseDatabase

let FIR_CHILD_USERS = "users"
let DB_BASE = FIRDatabase.database().reference()

class DataService {
    private var _REF_BASE = DB_BASE
    private var _REF_CHALLENGES = DB_BASE.child("Challenges")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_CHALLENGES: FIRDatabaseReference {
        return _REF_CHALLENGES
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    static let _instance = DataService()
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
