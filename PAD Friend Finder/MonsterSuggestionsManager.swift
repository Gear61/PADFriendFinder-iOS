//
//  MonsterSuggestionsManager.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 8/5/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation

class MonsterSuggestionsManager
{
    // Singleton instance. Do MonsterMapper.sharedInstance to fetch it
    static let sharedInstance = MonsterSuggestionsManager()
    
    // Ghetto static variable
    struct Static
    {
        static var monsterNames = MonsterMapper.sharedInstance.getMonsterList()
    }

    func getSuggestions(prefix: String) -> [String]
    {
        if prefix.isEmpty
        {
            return Constants.DEFAULT_MONSTERS
        }
        else if count(prefix) == 1
        {
            return [String]()
        }
        else
        {
            var suggestions = [String]()
            var monstersFound = 0
            let lowerPrefix = prefix.lowercaseString
            for monsterName in Static.monsterNames
            {
                if monsterName.contains(lowerPrefix)
                {
                    suggestions.append(monsterName)
                    monstersFound++
                    if monstersFound >= 10
                    {
                        break
                    }
                }
            }
            return suggestions
        }
    }
}
