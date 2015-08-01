//
//  MonsterBoxController.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/30/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation
import JLToast
import SwiftyJSON

class MonsterBoxController: UIViewController, UITableViewDataSource, UITableViewDelegate, apiConsumerDelegate
{
    @IBOutlet weak var loadingBox: UIActivityIndicatorView!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var monsterList: UITableView!
    @IBOutlet weak var noMonsters: UILabel!
    
    var restClient = RestClient()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        restClient.delegate = self
        if !MonsterBoxManager.sharedInstance.hasMadeApiCall()
        {
            restClient.makeHttpGetRequest(Constants.MONSTERS_KEY + getPadId())
        }
        else
        {
            refreshContent()
        }
    }
    
    // Lets tableview know how many cells/rows it should have
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return MonsterBoxManager.sharedInstance.getMonsterBoxSize()
    }
    
    // Render cell (getView)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MonsterCell") as! MonsterCell
        cell.configureForMenuItem(MonsterBoxManager.sharedInstance.getMonsterAtIndex(indexPath.row))
        
        // iOS by default makes the cell separators have left margins. Below 2 lines remove that
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        return cell
    }
    
    // On click listener for tableview item clicks
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func refreshContent()
    {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.loadingBox.hidden = true
            self.instructions.hidden = false
            if MonsterBoxManager.sharedInstance.getMonsterBoxSize() == 0
            {
                self.monsterList.hidden = true
                self.noMonsters.hidden = false
            }
            else
            {
                self.noMonsters.hidden = true
                self.monsterList.hidden = false
            }
        })
    }
    
    func responseReceived(response: apiCallResponse)
    {
        if response.httpStatus == 200
        {
            let initialBox = parseMonsterBox(response.response)
            for monster in initialBox
            {
                MonsterBoxManager.sharedInstance.updateMonsterList(monster)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.monsterList.reloadData()
                })
            }
        }
        else
        {
            JLToast.makeText(Constants.BOX_FETCH_FAILED_MESSAGE, duration: JLToastDelay.ShortDelay).show()
        }
        refreshContent()
    }
}