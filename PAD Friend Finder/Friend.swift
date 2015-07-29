//
//  Friend.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/28/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation

class Friend
{
    var padId: String
    var monster: Monster
    
    init(padId: String, monster: Monster)
    {
        self.padId = padId
        self.monster = monster
    }
}