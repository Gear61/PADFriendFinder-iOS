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
    var mode = Constants.ADD_MODE
    var chosenMonster : Monster!
    
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
        
        var plusIcon = UIImage(named: "plus")!
        var rightItem:UIBarButtonItem = UIBarButtonItem(image: resizeImage(plusIcon, CGSize(width: 15, height: 15)), style: UIBarButtonItemStyle.Plain, target: self, action: "openAddMonster")
        self.navigationItem.rightBarButtonItem = rightItem
        
        // Listen for events broadcasted by monster form indicating a monster change
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "monsterChangedListener:",
            name: Constants.MONSTER_UPDATE_KEY,
            object: nil)
    }
    
    func openAddMonster()
    {
        mode = Constants.ADD_MODE
        performSegueWithIdentifier("loadMonsterForm", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        var monsterFormController = segue.destinationViewController as! MonsterFormController
        monsterFormController.mode = mode
        if mode == Constants.SEARCH_MODE || mode == Constants.UPDATE_MODE
        {
            monsterFormController.monster = chosenMonster
        }
    }
    
    func monsterChangedListener(notification: NSNotification)
    {
        if let changedMonster = notification.object as? Monster
        {
            MonsterBoxManager.sharedInstance.updateMonsterList(changedMonster)
            monsterList.reloadData()
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
        cell.configureCell(MonsterBoxManager.sharedInstance.getMonsterAtIndex(indexPath.row))
        
        // iOS by default makes the cell separators have left margins. Below 2 lines remove that
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        return cell
    }
    
    // On click listener for tableview item clicks
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        chosenMonster = MonsterBoxManager.sharedInstance.getMonsterAtIndex(indexPath.row)
        let monsterName = chosenMonster.name
        
        let alertController = UIAlertController(title: nil, message: "Options for " + monsterName, preferredStyle: .Alert)
        
        let findAction = UIAlertAction(title: Constants.FIND_OTHERS, style: .Default) { (action) in
            self.mode = Constants.SEARCH_MODE
            self.performSegueWithIdentifier("loadMonsterForm", sender: self)
        }
        let editAction = UIAlertAction(title: Constants.EDIT, style: .Default) { (action) in
            self.mode = Constants.UPDATE_MODE
            self.performSegueWithIdentifier("loadMonsterForm", sender: self)
        }
        let deleteAction = UIAlertAction(title: Constants.DELETE, style: .Default) { (action) in
            self.loadingBox.hidden = false
            self.restClient.makeHttpPostRequest(Constants.DELETE_KEY, body: createDeleteMonsterBody(name: monsterName), action: Constants.DELETE_KEY)
        }
        let cancelAction = UIAlertAction(title: "None of the above", style: .Cancel) { (_) in }
        
        alertController.addAction(findAction)
        alertController.addAction(editAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true) {}
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
        if response.action == Constants.MONSTER_BOX_KEY
        {
            if response.httpStatus == 200
            {
                MonsterBoxManager.sharedInstance.setHasMadeApiCall()
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
                JLToast.makeText(Constants.BOX_FETCH_FAILED_MESSAGE, duration: JLToastDelay.LongDelay).show()
            }
        }
        else if response.action == Constants.DELETE_KEY
        {
            if response.httpStatus == 200
            {
                let deletedMonsterName = parseMonsterName(response.requestBody)
                MonsterBoxManager.sharedInstance.removeMonster(deletedMonsterName)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.monsterList.reloadData()
                })
                JLToast.makeText(Constants.MONSTER_DELETE_SUCCESS_MESSAGE, duration: JLToastDelay.LongDelay).show()
            }
            else
            {
                JLToast.makeText(Constants.MONSTER_DELETE_FAILED_MESSAGE, duration: JLToastDelay.LongDelay).show()
            }
        }
        refreshContent()
    }
}