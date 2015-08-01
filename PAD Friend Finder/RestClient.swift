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
    // Path that was invoked. Right now, used for upvoting responses
    var path : String
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
            let responseBundle = apiCallResponse(httpStatus: httpStatusCode!, response: response, requestBody: JSON("[]"), path: path)
            self.delegate?.responseReceived(responseBundle)
        })
        task.resume()
    }
    
    func makeHttpRequest(#body: JSON, path: String, httpMethod: String, headers: [String: String])
    {
        var request = NSMutableURLRequest(URL: NSURL(string: "https://mysterious-citadel-1245.herokuapp.com/monsters/377890281")!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = httpMethod
        
        var err: NSError?
        
        if (path != "GET")
        {
            request.HTTPBody = body.rawData()
        }
        
        for (key, value) in headers
        {
            request.addValue(key, forHTTPHeaderField: value)
        }
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            
            // Default response is internal server error with empty JSON
            var responseBundle = apiCallResponse(httpStatus: 500, response: JSON("{}"), requestBody: body, path: "")
            
            let httpStatusCode = (response as? NSHTTPURLResponse)?.statusCode
            println(httpStatusCode)
            
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            if err != nil
            {
                println("Bad JSON received")
            }
            else
            {
                // Make sure that json has a value using optional binding.
                if let parseJSON = json
                {
                    let swiftyJson = JSON(parseJSON)
                    responseBundle = apiCallResponse(httpStatus: httpStatusCode!, response: swiftyJson, requestBody: body, path: path)
                }
            }
            self.delegate?.responseReceived(responseBundle)
        })
        task.resume()
    }
}