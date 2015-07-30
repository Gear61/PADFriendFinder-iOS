//
//  PadIdController.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/30/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation

import UIKit

class PadIdFormController: UIViewController
{
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 5
    }
}
