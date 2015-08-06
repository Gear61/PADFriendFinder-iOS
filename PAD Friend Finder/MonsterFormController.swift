//
//  MonsterFormController.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/31/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation
import JLToast

class MonsterFormController: UIViewController, monsterChoiceDelegate, UITextFieldDelegate
{
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var level: UITextField!
    @IBOutlet weak var awakenings: UITextField!
    @IBOutlet weak var plusEggs: UITextField!
    @IBOutlet weak var skillLevel: UITextField!
    @IBOutlet weak var hypermax: UIButton!
    @IBOutlet weak var minimum: UIButton!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var suggestions: UITableView!
    @IBOutlet weak var suggestionsHeight: NSLayoutConstraint!
    
    var restClient = RestClient()
    var mode = Constants.SEARCH_MODE
    var monsterDelegate : MonsterACDelegate!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        minimum.addTarget(self, action: "minimize:", forControlEvents: .TouchUpInside)
        hypermax.addTarget(self, action: "hypermax:", forControlEvents: .TouchUpInside)
        submit.addTarget(self, action: "submitMonster:", forControlEvents: .TouchUpInside)
        
        monsterDelegate = MonsterACDelegate(table: suggestions, height: suggestionsHeight, delegate: self)
        suggestions.dataSource = monsterDelegate
        suggestions.delegate = monsterDelegate
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "nameInputListener:",
            name: UITextFieldTextDidChangeNotification,
            object: nameInput)
    }
    
    func setUpPage()
    {
        if mode == Constants.SEARCH_MODE
        {
            self.title = Constants.FIND_FRIENDS_LABEL
        }
        else if mode == Constants.ADD_MODE
        {
            self.title = Constants.ADD_MONSTER_LABEL
            self.nameInput.placeholder = Constants.HAVE_A_HINT
            setUpMonsterHints()
        }
        else if mode == Constants.UPDATE_MODE
        {
            self.title = Constants.UPDATE_MONSTER_LABEL
            self.nameInput.enabled = false
            setUpMonsterHints()
        }
    }
    
    func setUpMonsterHints()
    {
        level.placeholder = Constants.LEVEL_HINT
        awakenings.placeholder = Constants.AWAKENINGS_HINT
        plusEggs.placeholder = Constants.PLUS_EGGS_HINT
        skillLevel.placeholder = Constants.SKILL_LEVEL_HINT
    }
    
    func minimize(sender: AnyObject?)
    {
        level.text = String(1)
        awakenings.text = String(0)
        plusEggs.text = String(0)
        skillLevel.text = String(1)
    }
    
    func hypermax(sender: AnyObject?)
    {
        if let monsterInfo = MonsterMapper.sharedInstance.getMonsterInfo(nameInput.text)
        {
            level.text = String(monsterInfo.level)
            awakenings.text = String(monsterInfo.awakenings)
            plusEggs.text = String(Constants.MAX_PLUS_EGGS)
            skillLevel.text = String(monsterInfo.skillLevel)
        }
    }
    
    func submitMonster(sender: AnyObject?)
    {
        if let monsterInfo = MonsterMapper.sharedInstance.getMonsterInfo(nameInput.text)
        {
            if level.text.isEmpty || awakenings.text.isEmpty || plusEggs.text.isEmpty || skillLevel.text.isEmpty
            {
                JLToast.makeText(Constants.INVALID_MONSTER_MESSAGE, duration: JLToastDelay.LongDelay).show()
            }
            else
            {
                
            }
        }
        else
        {
            JLToast.makeText(Constants.INVALID_MONSTER_MESSAGE, duration: JLToastDelay.LongDelay).show()
        }
    }
    
    // Listener for monster input
    func nameInputListener(notification: NSNotification)
    {
        monsterDelegate.updateWithPrefix(nameInput.text)
        if let monsterInfo = MonsterMapper.sharedInstance.getMonsterInfo(nameInput.text)
        {
            picture.image = UIImage(named: monsterInfo.imageName)
        }
        else
        {
            // picture.image = UIImage(named: monsterInfo.imageName)
        }
    }
    
    // They stopped entering in a monster
    func textFieldDidEndEditing(textField: UITextField)
    {
        suggestions.hidden = true
    }
    
    func monsterChosen(monster: String)
    {
        nameInput.text = monster
        suggestions.hidden = true
        if let monsterInfo = MonsterMapper.sharedInstance.getMonsterInfo(nameInput.text)
        {
            picture.image = UIImage(named: monsterInfo.imageName)
        }
    }
}