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
    private var _videoLink: String!
    private var _gender: String!
    
    var reps: String {
        return _reps
    }
    
    var gender: String {
        return _gender
    }
    
    var videoLink: String {
        return _videoLink
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
    init(videoLink: String) {
        self._videoLink = videoLink
    }
    
    init(userKey: String, leaderData: Dictionary<String, AnyObject>) {
        self._userKey = userKey
        
        
        if let reps = leaderData["reps"] as? String {
            self._reps = reps
        }
        if let userName = leaderData["userName"] as? String {
            self._userName = userName
        }
        if let videoLink = leaderData["videoLink"] as? String {
            self._videoLink = videoLink
        }
        
        if let gender = leaderData["gender"] as? String {
            self._gender = gender
        }
        
    }
    
    
}
