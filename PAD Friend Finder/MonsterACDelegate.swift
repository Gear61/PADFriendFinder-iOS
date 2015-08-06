//
//  MonsterACDelegate.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 8/5/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation
import UIKit

protocol monsterChoiceDelegate
{
    func monsterChosen(monster: String)
}

class MosnterACDelegate: NSObject, UITableViewDataSource, UITableViewDelegate
{
    var names = [String]()
    var table: UITableView
    var height: NSLayoutConstraint
    var delegate: monsterChoiceDelegate
    var isKeyboardOpen: Bool
    var keyboardHeight: CGFloat
    var screenHeight: CGFloat
    
    init(table: UITableView, height: NSLayoutConstraint, delegate: monsterChoiceDelegate)
    {
        self.table = table
        self.height = height
        self.delegate = delegate
        self.isKeyboardOpen = false
        self.keyboardHeight = 0
        self.screenHeight = UIScreen.mainScreen().bounds.size.height
        super.init()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    // When keyboard shows, resize the friends table view to prevent anything being cut off
    func keyboardWillShow(notification: NSNotification)
    {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue()
        {
            isKeyboardOpen = true
            keyboardHeight = keyboardSize.height
        }
    }
    
    // When keyboard hides, resize friends table view to fit screen height
    func keyboardWillHide(notification: NSNotification)
    {
        isKeyboardOpen = false
    }
    
    // Lets tableview know how many cells/rows it should have
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return names.count
    }
    
    // Render cell (getView)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MonsterSuggestionCell") as! MonsterSuggestionCell
        let monsterName = names[indexPath.row]
        cell.configureCell(monsterName)
        
        // iOS by default makes the cell separators have left margins. Below 2 lines remove that
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        
        return cell
    }
    
    // On click listener for tableview item clicks
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.delegate.monsterChosen(names[indexPath.row])
    }
    
    func updateWithPrefix(prefix: String, loadDefaults: Bool)
    {
        self.names = MonsterSuggestionsManager.sharedInstance.getSuggestions(prefix)
        if (self.names.isEmpty)
        {
            self.table.hidden = true
        }
        else
        {
            self.table.hidden = false
            let keyboardDeficit = self.isKeyboardOpen ? self.keyboardHeight : 0
            // 114 = 64 (Top Layout Guide) + 10 (top margin) + 30 (target name) + 10 (bottom margin)
            let heightWithKeyboard = self.screenHeight - 114 - keyboardDeficit
            // Set height to smaller of the 2 values
            self.height.constant = CGFloat(names.count) * 60 > heightWithKeyboard ? heightWithKeyboard : CGFloat(names.count) * 60
            self.table.reloadData()
        }
    }
}