//
//  Challenge.swift
//  Fitness Challenge
//
//  Created by Travis Whitten on 12/29/16.
//  Copyright © 2016 Travis Whitten. All rights reserved.
//

import Foundation

class Challenge {
    private var _title: String!
    private var _description: String!
    private var _challengeKey: String!
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    var challengeKey: String {
        return _challengeKey
    }
    
    init(title: String, description: String) {
        self._title = title
        self._description = description
    }
    
    init(challengeKey: String, challengeData: Dictionary<String, AnyObject>) {
        self._challengeKey = challengeKey
        
        
        if let description = challengeData["description"] as? String {
            self._description = description
        }
        if let title = challengeData["title"] as? String {
            self._title = title
        }
        
    }
    
}
