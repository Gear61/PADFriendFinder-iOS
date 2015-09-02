//
//  Monster.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/28/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation

class Monster
{
    var name: String
    var level: Int
    var awakenings: Int
    var skillLevel: Int
    var monsterId: Int
    var plusEggs: Int
    
    init(level: Int, skillLevel: Int, awakenings: Int, monsterId: Int)
    {
        self.level = level
        self.awakenings = awakenings
        self.skillLevel = skillLevel
        self.monsterId = monsterId
        self.name = "Unknown"
        self.plusEggs = 0
    }
}
