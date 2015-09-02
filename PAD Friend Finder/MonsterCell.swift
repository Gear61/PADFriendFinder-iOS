//
//  MonsterCell.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/30/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import UIKit

class MonsterCell: UITableViewCell
{
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var awakenings: UILabel!
    @IBOutlet weak var plusEggs: UILabel!
    @IBOutlet weak var skillLevel: UILabel!
    
    func configureCell(monster: Monster)
    {
        ImageUtils.loadMonsterPicture(monsterId: monster.monsterId, imageView: picture)
        name.text = monster.name
        level.text = String(monster.level)
        awakenings.text = String(monster.awakenings)
        plusEggs.text = String(monster.plusEggs)
        skillLevel.text = String(monster.skillLevel)
    }
}