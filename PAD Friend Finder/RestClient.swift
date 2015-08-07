//
//  RestClient.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 7/28/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation
import SwiftyJSON

struct apiCallResponse
{
    var httpStatus : Int
    var response : JSON
    // Before or after
    var requestBody : JSON
    // Action performed (monster update, monster add, etc)
    var action : String
}

protocol apiConsumerDelegate
{
    func responseReceived(response: apiCallResponse)
}

class RestClient
{
    var delegate: apiConsumerDelegate?
    
    func makeHttpGetRequest(path: String)
    {
        let request = NSMutableURLRequest(URL: NSURL(string: Constants.SERVER_URL + path)!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            let httpStatusCode = (response as? NSHTTPURLResponse)?.statusCode
            let response = JSON(data: data)
            let responseBundle = apiCallResponse(httpStatus: httpStatusCode!, response: response, requestBody: JSON("[]"), action: Constants.MONSTER_BOX_KEY)
            self.delegate?.responseReceived(responseBundle)
        })
        task.resume()
    }
    
    func makeHttpPostRequest(path: String, body: JSON, action: String)
    {
        let request = NSMutableURLRequest(URL: NSURL(string: Constants.SERVER_URL + path)!)
        request.HTTPMethod = "POST"
        request.HTTPBody = body.rawData()
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            let httpStatusCode = (response as? NSHTTPURLResponse)?.statusCode
            let response = JSON(data: data)
            let responseBundle = apiCallResponse(httpStatus: httpStatusCode!, response: response, requestBody: body, action: action)
            self.delegate?.responseReceived(responseBundle)
        }
        task.resume()
    }
}