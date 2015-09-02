//
//  ImageUtils.swift
//  PAD Friend Finder
//
//  Created by Alexander Chiou on 8/6/15.
//  Copyright (c) 2015 Alexander Chiou. All rights reserved.
//

import Foundation
import UIKit

func resizeImage (image: UIImage, newSize: CGSize) -> UIImage
{
    var newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height))
    var imageRef = image.CGImage
    
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
    var context = UIGraphicsGetCurrentContext()
    
    // Set the quality level to use when rescaling
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh)
    var flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, newSize.height)
    
    CGContextConcatCTM(context, flipVertical);
    // Draw into the context; this scales the image
    CGContextDrawImage(context, newRect, imageRef);
    
    // Get the resized image from the context and a UIImage
    var newImageRef = CGBitmapContextCreateImage(context)
    var newImage = UIImage(CGImage: newImageRef)!
    
    UIGraphicsEndImageContext()
    
    return newImage;
}

class ImageUtils
{
    // Swift classes don't support static variables, but structs do, so here's a hack
    struct Static
    {
        static var imageCache = [String : UIImage]()
    }
    
    static func loadMonsterPicture(#monsterId : Int, imageView : UIImageView)
    {
        // Construct Graph API url for Facebook picture
        let urlString = "http://puzzledragonx.com/en/img/book/" + String(monsterId) + ".png"
        
        // Check our image cache for the existing key. This is just a dictionary of UIImages
        var image = Static.imageCache[urlString]
        
        if image == nil
        {
            // If the image does not exist, we need to download it
            var imgURL: NSURL = NSURL(string: urlString)!
            
            // Download an NSData representation of the image at the URL
            let request: NSURLRequest = NSURLRequest(URL: imgURL)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
                if error == nil
                {
                    image = UIImage(data: data)
                    
                    // Store the image in to our cache
                    Static.imageCache[urlString] = image
                    dispatch_async(dispatch_get_main_queue(),
                    {
                        imageView.image = image
                    })
                }
            })
            
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(),
            {
                imageView.image = image
            })
        }
    }
}
