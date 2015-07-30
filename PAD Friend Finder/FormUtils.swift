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
