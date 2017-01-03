//
//  Leaderboard.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 1/2/17.
//  Copyright © 2017 Travis Whitten. All rights reserved.
//

import Foundation

class Leaderboard {
    private var _reps: String!
    private var _userKey: String!
    private var _challengeKey: String!
    private var _userName: String!
    
    var reps: String {
        return _reps
    }
    
    var userName: String {
        return _userName
    }
    
    var userKey: String {
        return _userKey
    }
    
    var challengeKey: String {
        return _challengeKey
    }
    
    init(reps: String) {
        self._reps = reps
    
    }
    
    init(userKey: String, leaderData: Dictionary<String, AnyObject>) {
        self._userKey = userKey
        
        
        if let reps = leaderData["reps"] as? String {
            self._reps = reps
        }
        if let userName = leaderData["userName"] as? String {
            self._userName = userName
        }
        
        
    }
    
}
