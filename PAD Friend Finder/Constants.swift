//
//  Constants.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/28/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation
import UIKit

class Constants
{
    // DEFAULT MONSTERS (5 we deem the most popular)
    static let DEFAULT_MONSTERS = ["Marvelous Red Dragon Caller, Sonia",
                                   "Sparkling Goddess of Secrets, Kali",
                                   "Chaotic Flying General, Lu Bu",
                                   "Guardian of the Sacred City, Athena",
                                   "Keeper of the Sacred Texts, Metatron"]
    
    // Visuals
    static let CUSTOM_GRAY = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    static let SCREEN_SIZE = UIScreen.mainScreen().bounds
    static let SCREEN_WIDTH = SCREEN_SIZE.width
    static let SCREEN_HEIGHT = SCREEN_SIZE.height
    
    // Welcome
    static let WELCOME_MESSAGE = "Welcome to PAD Friend Finder!";
    
    // PAD ID form
    static let PAD_ID_LENGTH = 9
    static let INCOMPLETE_PAD_ID_MESSAGE = "Please enter in all 9 digits of your PAD ID.";
    static let INCORRECT_FIRST_DIGIT_MESSAGE = "We only support NA right now, so your PAD ID's first" +
    " digit must be 3.";
    static let PAD_ID_CONFIRMATION = "PAD ID Confirmation";
    
    // Monster search
    static let MONSTER_FORM_INCOMPLETE_MESSAGE = "Please fill in every field before submitting.";
    static let MONSTER_INVALID = "Please enter in a valid monster name."
    static let UNKNOWN_MONSTER_PICTURE_NAME = "mystery_monster"
    static let NON_NUMERIC_MESSAGE = "Level, awakenings, plus eggs, and skill level must all be numeric values."
    
    // API
    static let SERVER_URL = "https://mysterious-citadel-1245.herokuapp.com/";
    static let PAD_ID_KEY = "pad_ID";
    static let MONSTER_KEY = "monster";
    static let MONSTERS_KEY = "monsters/";
    static let NAME_KEY = "name";
    static let LEVEL_KEY = "level";
    static let SKILL_LEVEL_KEY = "skill_level";
    static let AWAKENINGS_KEY = "awakenings";
    static let PLUS_EGGS_KEY = "plus_eggs";
    static let FETCH_FRIENDS_KEY = "fetch";
    static let UPDATE_KEY = "update";
    static let DELETE_KEY = "delete";
    
    // Activity communication/broadcasts
    static let MODE_KEY = "mode";
    static let MONSTER_UPDATE_KEY = "monsterUpdate";
    static let MONSTER_BOX_KEY = "monsterBox";
    static let REST_CALL_RESPONSE_KEY = "restCallResponse";
    
    // Monster form
    static let HAVE_A_HINT = "I have a...";
    static let LEVEL_HINT = "Level";
    static let AWAKENINGS_HINT = "# of Awakenings";
    static let PLUS_EGGS_HINT = "# of + Eggs";
    static let SKILL_LEVEL_HINT = "Skill Level";
    static let SEARCH_MODE = "Search";
    static let ADD_MODE = "Add";
    static let UPDATE_MODE = "Update";
    static let FIND_FRIENDS_LABEL = "Find Friends";
    static let ADD_MONSTER_LABEL = "Add Monster";
    static let UPDATE_MONSTER_LABEL = "Update Monster";
    static let MAX_PLUS_EGGS = 297;
    static let LOOKING_FOR_HINT = "I am looking for...";
    static let INVALID_MONSTER_MESSAGE = "Please enter in a valid monster name.";
    static let MONSTER_ADD_FAILED_MESSAGE = "We were unable to add your monster to our database. " +
    "Please try again later.";
    static let MONSTER_UPDATE_FAILED_MESSAGE = "We were unable to update your monster in our database. " +
    "Please try again later.";
    static let MONSTER_ADD_SUCCESS_MESSAGE = "Your monster was successfully added to our database.";
    static let MONSTER_UPDATE_SUCCESS_MESSAGE = "Your monster was successfully updated in our database.";
    static let ADDING_MONSTER = "Adding your monster to our database...";
    static let UPDATING_MONSTER = "Updating your monster in our database...";
    
    // Friend results
    static let PAD_ID_COPIED_MESSAGE = "PAD ID copied to clipboard.";
    static let FETCH_FRIENDS_FAILED_MESSAGE = "We were unable to find friends for you. " +
    "Please try again later.";
    
    // Monster box
    static let BOX_FETCH_FAILED_MESSAGE = "We were unable to fetch your monster box. " +
    "Please try again later.";
    static let MONSTER_DELETE_SUCCESS_MESSAGE = "Your monster was successfully deleted from our database.";
    static let MONSTER_DELETE_FAILED_MESSAGE = "We were unable to delete your monster from our database. " +
    "Please try again later.";
    static let DELETING_MONSTER_MESSAGE = "Deleting your monster from our database...";
    static let FIND_OTHER = "Find other";
    static let EDIT = "Edit";
    static let DELETE = "Delete";
}
