//
//  SessionManager.swift
//  Describe
//
//  Created by Alexander Chiou on 5/9/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation

func setPadId (padId: String)
{
    let preferences = NSUserDefaults.standardUserDefaults()
    preferences.setObject(padId, forKey: Constants.PAD_ID_KEY)
    preferences.synchronize()
}

func getPadId() -> String
{
    let preferences = NSUserDefaults.standardUserDefaults()
    return preferences.stringForKey(Constants.PAD_ID_KEY) ?? ""
}