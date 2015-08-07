//
//  FriendCel.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/30/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell
{
    @IBOutlet weak var padId: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var awakenings: UILabel!
    @IBOutlet weak var plusEggs: UILabel!
    @IBOutlet weak var skillLevel: UILabel!
    
    func configureCell(friend: Friend)
    {
        padId.text = friend.padId
        level.text = String(friend.monster.level)
        awakenings.text = String(friend.monster.awakenings)
        plusEggs.text = String(friend.monster.plusEggs)
        skillLevel.text = String(friend.monster.skillLevel)
    }
}
