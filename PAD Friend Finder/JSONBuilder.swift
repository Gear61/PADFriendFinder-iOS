//
//  JSONBuilder.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/28/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation
import SwiftyJSON

func createUpdateMonsterBody(#name: String, #level: Int, #awakenings: Int, #plusEggs: Int, #skillLevel: Int) -> JSON
{
    let monsterJson : JSON =
    [
        Constants.NAME_KEY: name,
        Constants.LEVEL_KEY: level,
        Constants.AWAKENINGS_HINT: awakenings,
        Constants.PLUS_EGGS_KEY: plusEggs,
        Constants.SKILL_LEVEL_KEY: skillLevel
    ]
    
    let updateMonsterBody : JSON =
    [
        Constants.PAD_ID_KEY : getPadId(),
        Constants.MONSTER_KEY : monsterJson.object
    ]
    return updateMonsterBody
}

func findFriendsBody(#name: String, #level: Int, #awakenings: Int, #plusEggs: Int, #skillLevel: Int) -> JSON
{
    return createUpdateMonsterBody(name: name, level: level, awakenings: awakenings, plusEggs: plusEggs, skillLevel: skillLevel)
}
