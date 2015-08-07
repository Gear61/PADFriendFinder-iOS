//
//  MonsterBoxManager.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/30/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation

class MonsterBoxManager
{
    // Singleton instance. Do MonsterMapper.sharedInstance to fetch it
    static let sharedInstance = MonsterBoxManager()
    
    // Ghetto static variable
    struct Static
    {
        static var monsters = [Monster]()
        static var monsterNames = Set<String>()
        static var hasMadeApiCall = false
    }
    
    func setHasMadeApiCall()
    {
        Static.hasMadeApiCall = true
    }
    
    func isMonsterRedundant(monsterName: String) -> Bool
    {
        return Static.monsterNames.contains(monsterName)
    }
    
    func hasMadeApiCall() -> Bool
    {
        return Static.hasMadeApiCall
    }
    
    func getMonsterBoxSize() -> Int
    {
        return Static.monsters.count
    }
    
    func getMonsterAtIndex(index: Int) -> Monster
    {
        return Static.monsters[index]
    }
    
    // Adds/updates monster in list
    func updateMonsterList(monster: Monster)
    {
        if !(Static.monsters.isEmpty)
        {
            for i in 0...(Static.monsters.count - 1)
            {
                if Static.monsters[i].name == monster.name
                {
                    Static.monsters[i] = monster
                    return
                }
            }
        }
        Static.monsters.append(monster)
        Static.monsterNames.insert(monster.name)
    }
    
    func removeMonster(monsterName: String)
    {
        if !(Static.monsters.isEmpty)
        {
            for i in 0...(Static.monsters.count - 1)
            {
                if Static.monsters[i].name == monsterName
                {
                    Static.monsters.removeAtIndex(i)
                    return
                }
            }
        }
    }
}