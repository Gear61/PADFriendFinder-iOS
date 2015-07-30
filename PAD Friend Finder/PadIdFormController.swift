//
//  PadIdController.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/30/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation

import UIKit
import JLToast

class PadIdFormController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var padIdInput: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: "submitListener:", forControlEvents: .TouchUpInside)
    }
    
    func submitListener(sender: AnyObject?)
    {
        // Disable the keyboard so that any potential explanatory toasts are visible
        self.view.endEditing(true)
        
        if validatePadId(padIdInput.text)
        {
            // Confirmation dialog
            var message = "You have entered in " + padIdInput.text + " as your PAD ID. Are you absolutely sure that this is correct? Remember, you can only enter in your ID once."
            var refreshAlert = UIAlertController(title: "PAD ID Confirmation", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            refreshAlert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action: UIAlertAction!) in
                
                // User confirms their PAD ID. Load homepage
                setPadId(self.padIdInput.text)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let navController = UINavigationController(rootViewController: (storyboard.instantiateViewControllerWithIdentifier("Homepage") as? UIViewController)!)
                self.presentViewController(navController, animated: true, completion: nil)
                JLToast.makeText(Constants.WELCOME_MESSAGE, duration: JLToastDelay.ShortDelay).show()
                
            }))
            refreshAlert.addAction(UIAlertAction(title: "No", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            presentViewController(refreshAlert, animated: true, completion: nil)
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        if count(textField.text) == Constants.PAD_ID_LENGTH && !string.isEmpty
        {
            return false
        }
        return true
    }
}
