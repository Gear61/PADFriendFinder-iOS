//
//  StringUtils.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/30/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation

extension String
{
    subscript (i: Int) -> Character
    {
            return self[advance(self.startIndex, i)]
    }
    
    subscript (i: Int) -> String
    {
            return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String
        {
            if r.endIndex >= count(self)
            {
                return self
            }
            return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
    
    // Returns substring given a start and end index inclusive
    func substring(beginIndex: Int, endIndex: Int) -> String
    {
        var selfLength = count(self)
        var endCharsStripped = selfLength - endIndex - 1
        return self.substringWithRange(Range<String.Index>(start: advance(self.startIndex, beginIndex), end: advance(self.endIndex, endCharsStripped * -1)))
    }
}