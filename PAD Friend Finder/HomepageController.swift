//
//  HomepageController.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 9/1/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//


import UIKit
import JLToast

class HomepageController: UIViewController, apiConsumerDelegate
{
    @IBOutlet weak var loadingMonsterList: UIActivityIndicatorView!
    
    var restClient = RestClient()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        restClient.delegate = self
        JLToast.makeText(Constants.LOADING_MONSTER_LIST_MESSAGE, duration: JLToastDelay.ShortDelay).show()
        restClient.makeHttpGetRequest(Constants.GET_MONSTERS_KEY)
    }
    
    func responseReceived(response: apiCallResponse)
    {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.loadingMonsterList.hidden = true
        })
        if response.httpStatus == 200
        {
            let monsters = parseMonsterList(response.response)
            MonsterMapper.sharedInstance.addMonsters(monsters)
            JLToast.makeText(Constants.MONSTER_LIST_LOADED_MESSAGE, duration: JLToastDelay.ShortDelay).show()
        }
        else
        {
            JLToast.makeText(Constants.MONSTER_LIST_FAILED_MESSAGE, duration: JLToastDelay.ShortDelay).show()
        }
    }
}
