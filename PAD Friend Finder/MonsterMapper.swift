//
//  MonsterMapper.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/28/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation

class MonsterMapper
{
    // Singleton instance. Do MonsterMapper.sharedInstance to fetch it
    static let sharedInstance = MonsterMapper()
    
    // Ghetto static variable
    struct Static
    {
        static var nameToInfo = [String: Monster]()
    }
    
    func addMonsters(monsters: [Monster])
    {
        for monster in monsters
        {
            Static.nameToInfo[monster.name] = monster
        }
    }
    
    func getMonsterList() -> [String]
    {
        let monsterNames = Array(Static.nameToInfo.keys)
        return sorted(monsterNames, <)
    }
    
    func getMonsterInfo(monsterName: String) -> Monster?
    {
        return Static.nameToInfo[monsterName]
    }
}
