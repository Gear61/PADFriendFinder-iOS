//
//  FormUtils.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/30/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation
import JLToast

func validatePadId(padId: String) -> Bool
{
    if count(padId) != Constants.PAD_ID_LENGTH
    {
        JLToast.makeText(Constants.INCOMPLETE_PAD_ID_MESSAGE, duration: JLToastDelay.LongDelay).show()
        return false
    }
    else if padId.substring(0, endIndex: 0) != "3"
    {
        JLToast.makeText(Constants.INCORRECT_FIRST_DIGIT_MESSAGE, duration: JLToastDelay.LongDelay).show()
        return false
    }
    return true
}

func validateMonsterInput(name: String, level: String, awakenings: String, plusEggs: String, skillLevel: String) -> Bool
{
    if let monsterInfo = MonsterMapper.sharedInstance.getMonsterInfo(name)
    {
        if level.isEmpty || awakenings.isEmpty || plusEggs.isEmpty || skillLevel.isEmpty
        {
            JLToast.makeText(Constants.MONSTER_FORM_INCOMPLETE_MESSAGE, duration: JLToastDelay.LongDelay).show()
            return false
        }
        else
        {
            let levelInput = level.toInt()
            let awakeningsInput = awakenings.toInt()
            let plusEggsInput = plusEggs.toInt()
            let skillLevelInput = skillLevel.toInt()
            if levelInput != nil && awakeningsInput != nil && plusEggsInput != nil && skillLevelInput != nil
            {
                let inputtedMonster = Monster(level: levelInput!, skillLevel: skillLevelInput!, awakenings: awakeningsInput!, monsterId: 0)
                inputtedMonster.plusEggs = plusEggsInput!
                inputtedMonster.name = name
                return isValidMonster(inputtedMonster)
            }
            else
            {
                JLToast.makeText(Constants.NON_NUMERIC_MESSAGE, duration: JLToastDelay.LongDelay).show()
                return false
            }
        }
    }
    else
    {
        JLToast.makeText(Constants.INVALID_MONSTER_MESSAGE, duration: JLToastDelay.LongDelay).show()
        return false
    }
}

func isValidMonster(monster: Monster) -> Bool
{
    if let linkedMonster = MonsterMapper.sharedInstance.getMonsterInfo(monster.name)
    {
        if monster.level < 1 || monster.level > linkedMonster.level
        {
            JLToast.makeText(monster.name + " can only have a level between 1 and " + String(linkedMonster.level) + ".", duration: JLToastDelay.LongDelay).show()
            return false
        }
        else if monster.awakenings < 0 || monster.awakenings > linkedMonster.awakenings
        {
            JLToast.makeText(monster.name + " can only have between 0 and " + String(linkedMonster.awakenings) + " awakenings.", duration: JLToastDelay.LongDelay).show()
            return false
        }
        else if monster.plusEggs < 0 || monster.plusEggs > Constants.MAX_PLUS_EGGS
        {
            JLToast.makeText("A monster can only have between 0 and " + String(Constants.MAX_PLUS_EGGS) + " plus eggs.", duration: JLToastDelay.LongDelay).show()
            return false
        }
        else if monster.skillLevel < 1 || monster.skillLevel > linkedMonster.skillLevel
        {
            JLToast.makeText(monster.name + " can only have a skill level between 1 and " + String(linkedMonster.skillLevel) + ".", duration: JLToastDelay.LongDelay).show()
            return false
        }
    }
    else
    {
        JLToast.makeText(Constants.INVALID_MONSTER_MESSAGE, duration: JLToastDelay.ShortDelay).show()
        return false
    }
    return true
}
