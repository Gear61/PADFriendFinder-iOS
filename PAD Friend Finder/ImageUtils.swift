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