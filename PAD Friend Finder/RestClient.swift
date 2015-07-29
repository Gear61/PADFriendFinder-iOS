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
    
    func makeHttpRequest(#body: JSON, path: String, httpMethod: String, headers: [String: String], feedMode: String)
    {
        var request = NSMutableURLRequest(URL: NSURL(string: Constants.SERVER_URL + path)!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = httpMethod
        
        var err: NSError?
        
        // Add headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = body.rawData()
        
        request.addValue("ios", forHTTPHeaderField: "Source")
        for (key, value) in headers
        {
            request.addValue(key, forHTTPHeaderField: value)
        }
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            
            // Default response is internal server error with empty JSON
            var responseBundle = apiCallResponse(httpStatus: 500, response: JSON("[]"), requestBody: body, path: "")
            
            let httpStatusCode = (response as? NSHTTPURLResponse)?.statusCode
            
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
                    var swiftyJson = JSON("[]")
                    if httpStatusCode! == 200
                    {
                        let swiftyJson = JSON(parseJSON)
                    }
                    else
                    {
                        swiftyJson = JSON(parseJSON)
                    }
                    responseBundle = apiCallResponse(httpStatus: httpStatusCode!, response: swiftyJson, requestBody: body, path: path)
                }
            }
            self.delegate?.responseReceived(responseBundle)
        })
        task.resume()
    }
}