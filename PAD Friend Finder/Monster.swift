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
    var imageName: String
    var plusEggs: Int
    
    init(level: Int, skillLevel: Int, awakenings: Int, imageName: String)
    {
        self.level = level
        self.awakenings = awakenings
        self.skillLevel = skillLevel
        self.imageName = imageName
        self.name = ""
        self.plusEggs = 0
    }
}
