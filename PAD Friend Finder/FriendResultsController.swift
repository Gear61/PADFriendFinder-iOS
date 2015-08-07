//
//  FriendResultsController.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 8/6/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import UIKit
import JLToast

class FriendResultsController: UIViewController, apiConsumerDelegate, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var progress: UIActivityIndicatorView!
    @IBOutlet weak var intro: UILabel!
    @IBOutlet weak var monsterPicture: UIImageView!
    @IBOutlet weak var monsterName: UILabel!
    @IBOutlet weak var friendResults: UITableView!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var noResults: UILabel!
    
    var restClient = RestClient()
    var monster : Monster!
    var friends = [Friend]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        restClient.delegate = self
        monsterPicture.image = UIImage(named: monster.imageName)
        monsterName.text = monster.name
        let body = createFindFriendsBody(name: monster.name, level: monster.level, awakenings: monster.awakenings, plusEggs: monster.plusEggs, skillLevel: monster.skillLevel)
        restClient.makeHttpPostRequest(Constants.FETCH_FRIENDS_KEY, body: body, action: Constants.FIND_FRIENDS_LABEL)
    }
    
    // Lets tableview know how many cells/rows it should have
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return friends.count
    }
    
    // Render cell (getView)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell") as! FriendCell
        cell.configureCell(friends[indexPath.row])
        
        // iOS by default makes the cell separators have left margins. Below 2 lines remove that
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        return cell
    }
    
    // On click listener for tableview item clicks
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        UIPasteboard.generalPasteboard().string = friends[indexPath.row].padId
        JLToast.makeText(Constants.PAD_ID_COPIED_MESSAGE, duration: JLToastDelay.ShortDelay).show()
    }
    
    func responseReceived(response: apiCallResponse)
    {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.progress.hidden = true
        })
        if response.httpStatus == 200
        {
            friends = parseFriendResultsResponse(response.response)
        }
        else
        {
            JLToast.makeText(Constants.FETCH_FRIENDS_FAILED_MESSAGE, duration: JLToastDelay.LongDelay).show()
        }
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            if self.friends.isEmpty
            {
                self.noResults.hidden = false
            }
            else
            {
                self.friendResults.reloadData()
                self.friendResults.hidden = false
            }
            self.intro.hidden = false
            self.monsterPicture.hidden = false
            self.monsterName.hidden = false
            self.instructions.hidden = false
        })
    }
}
