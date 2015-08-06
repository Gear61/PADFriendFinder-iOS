//
//  MonsterFormController.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/31/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation
import JLToast

class MonsterFormController: UIViewController
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
    
    var restClient = RestClient()
    var mode = Constants.SEARCH_MODE
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        minimum.addTarget(self, action: "minimize:", forControlEvents: .TouchUpInside)
        submit.addTarget(self, action: "submitMonster:", forControlEvents: .TouchUpInside)
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
            setUpMonsterHints()
        }
        else if mode == Constants.UPDATE_MODE
        {
            self.title = Constants.UPDATE_MONSTER_LABEL
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
}