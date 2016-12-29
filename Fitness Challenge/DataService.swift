//
//  DataService.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/20/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import Foundation
import FirebaseDatabase
import SwiftKeychainWrapper

let FIR_CHILD_USERS = "users"
let DB_BASE = FIRDatabase.database().reference()

class DataService {
    private var _REF_BASE = DB_BASE
    private var _REF_CHALLENGES = DB_BASE.child("challenge")
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
    
   /* var REF_USER_CURRENT: FIRDatabaseReference {
        let uid = KeychainWrapper.standard.string(forKey: KEY_UID)
        let user = REF_USERS.child(uid!)
        return user
    }*/
    
    static let ds = DataService()
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
