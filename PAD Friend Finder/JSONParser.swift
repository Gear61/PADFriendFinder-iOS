//
//  JSONParser.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/28/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation
import SwiftyJSON

func parseMonsterJson(monsterJson: JSON) -> Monster
{
    var monster = Monster(level: 0, skillLevel: 0, awakenings: 0, monsterId: 0)
    let monsterName = monsterJson[Constants.NAME_KEY].string ?? ""
    if !monsterName.isEmpty
    {
        monster.name = monsterName
    }
    if let monsterId = monsterJson[Constants.MONSTER_ID_KEY].int
    {
        monster.monsterId = monsterId
    }
    else
    {
        if let monsterInfo = MonsterMapper.sharedInstance.getMonsterInfo(monsterName)
        {
            monster.monsterId = monsterInfo.monsterId
        }
    }
    monster.level = monsterJson[Constants.LEVEL_KEY].int ?? 0
    monster.awakenings = monsterJson[Constants.AWAKENINGS_KEY].int ?? 0
    monster.plusEggs = monsterJson[Constants.PLUS_EGGS_KEY].int ?? 0
    monster.skillLevel = monsterJson[Constants.SKILL_LEVEL_KEY].int ?? 0
    return monster
}

func parseFriendResultsResponse(friendResultsJson: JSON) -> [Friend]
{
    var friendResults = [Friend]()
    if let friendResultsArray = friendResultsJson.array
    {
        for friendResult in friendResultsArray
        {
            let padId = friendResult[Constants.PAD_ID_KEY].string ?? ""
            let monster = parseMonsterJson(friendResult)
            friendResults.append(Friend(padId: padId, monster: monster))
        }
    }
    return friendResults
}

func parseMonsterBox(monsterBoxJson: JSON) -> [Monster]
{
    var monsters = [Monster]()
    if let monstersArray = monsterBoxJson.array
    {
        for monster in monstersArray
        {
            monsters.append(parseMonsterJson(monster))
        }
    }
    return monsters
}

func parseMonsterName(monsterDeleteJson: JSON) -> String
{
    return monsterDeleteJson[Constants.NAME_KEY].string!
}

func parseMonsterList(monsterListJson: JSON) -> [Monster]
{
    return parseMonsterBox(monsterListJson)
}